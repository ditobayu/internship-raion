import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internship_raion/post/domain/entity/post.dart';
import 'package:internship_raion/post/presentation/bloc/post/remote/remote_post_bloc.dart';
import 'package:internship_raion/post/presentation/widgets/forms.dart';
import 'package:internship_raion/shared/shared.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  int _selectedCategoriesIndex = 4;
  String _selectedCategories = "";
  XFile? selectedImage;
  PostEntity? post;

  DateTime? _selectedDate;

  final titleController = TextEditingController(text: '');
  final senderController = TextEditingController(text: '');
  final captionController = TextEditingController(text: '');

  void _submitData() {
    print("qwe");
    final enteredTitle = titleController.text;
    final enteredSender = senderController.text;
    final enteredCaption = captionController.text;

    final imagePath = 'post-image/${selectedImage!.path}';
    final image = File(imagePath);
    print(image);

    PostEntity postq = PostEntity(
        id: "",
        title: enteredTitle,
        imageUrl: "",
        date: _selectedDate.toString(),
        caption: enteredCaption,
        category: _selectedCategories,
        userId: 'qwe',
        userName: enteredSender);

    context.read<RemotePostBloc>().add(CreateRemotePost(postq, selectedImage!));

    if (enteredTitle.isEmpty ||
        enteredSender.isEmpty ||
        enteredCaption.isEmpty) {
      return;
    }

    post = PostEntity(
      id: "",
      title: enteredTitle,
      date: _selectedDate.toString(),
      category: _selectedCategoriesIndex.toString(),
      caption: enteredCaption,
      imageUrl: selectedImage!.path,
      userId: '1',
      userName: enteredSender,
    );

    print(post);
  }

  void _pickDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  Future<XFile?> selectImage() async {
    XFile? selectedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    return selectedImage;
  }

  bool validate() {
    if (selectedImage == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(context),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      backgroundColor: blueColor,
      title: Text(
        'Request Information',
        style: whiteTextStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),

      iconTheme: const IconThemeData(color: Colors.white), // Add this line
    );
  }

  _buildBody(context) {
    return BlocBuilder<RemotePostBloc, RemotePostState>(
      builder: (context, state) {
        return Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: blueColor,
                ),
              ),
            ),
            ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPostForm(context),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  _buildPostForm(context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 130,
            height: 30,
            // padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: orangeColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                'Pilih Kategori',
                style: whiteTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(height: 21),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 30,
                width: 85,
                child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: _selectedCategoriesIndex == 0
                          ? blueColor
                          : _selectedCategoriesIndex == 4
                              ? blueColor
                              : lightBlueColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedCategoriesIndex = 0;
                        _selectedCategories = "filkom";
                      });
                    },
                    child: Text(
                      "Info Filkom",
                      style: whiteTextStyle.copyWith(
                          fontSize: 10, fontWeight: FontWeight.w500),
                    )),
              ),
              Container(
                height: 30,
                width: 85,
                child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: _selectedCategoriesIndex == 1
                          ? blueColor
                          : _selectedCategoriesIndex == 4
                              ? blueColor
                              : lightBlueColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedCategoriesIndex = 1;
                        _selectedCategories = "lomba";
                      });
                    },
                    child: Text(
                      "Info Lomba",
                      style: whiteTextStyle.copyWith(
                          fontSize: 10, fontWeight: FontWeight.w500),
                    )),
              ),
              Container(
                height: 30,
                width: 85,
                child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: _selectedCategoriesIndex == 2
                          ? blueColor
                          : _selectedCategoriesIndex == 4
                              ? blueColor
                              : lightBlueColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedCategoriesIndex = 2;
                        _selectedCategories = "lo/lof";
                      });
                    },
                    child: Text(
                      "Info LO/LOF",
                      style: whiteTextStyle.copyWith(
                          fontSize: 10, fontWeight: FontWeight.w500),
                    )),
              ),
              Container(
                height: 30,
                width: 85,
                child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: _selectedCategoriesIndex == 3
                          ? blueColor
                          : _selectedCategoriesIndex == 4
                              ? blueColor
                              : lightBlueColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedCategoriesIndex = 3;
                        _selectedCategories = "beasiswa & magang";
                      });
                    },
                    child: Text(
                      "Info Beasiswa",
                      style: whiteTextStyle.copyWith(
                          fontSize: 10, fontWeight: FontWeight.w500),
                    )),
              ),
            ],
          ),
          const SizedBox(height: 21),
          CustomPostTextInput(
            label: "Judul",
            hintText: "Masukkan judul",
            controller: titleController,
            inputType: TextInputType.multiline,
          ),
          const SizedBox(
            height: 9,
          ),
          CustomPostTextInput(
            label: "Pengirim",
            hintText: "Masukkan nama pengirim",
            controller: senderController,
            inputType: TextInputType.multiline,
          ),
          const SizedBox(
            height: 9,
          ),
          CustomPostInputImage(
            selectedDate: _selectedDate,
            label: "Tanggal",
            hintText: "Masukkan tanggal",
            onPressed: _pickDate,
          ),
          const SizedBox(
            height: 9,
          ),
          GestureDetector(
            onTap: () async {
              final image = await selectImage();
              setState(() {
                selectedImage = image;
              });
            },
            child: Container(
              height: 210,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(30),
                color: greyInputColor,
                image: selectedImage == null
                    ? null
                    : DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(
                          File(
                            selectedImage!.path,
                          ),
                        ),
                      ),
              ),
              child: selectedImage != null
                  ? null
                  : Center(
                      child: Text("Pilih gambar"),
                    ),
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          CustomPostTextArea(
            hintText: "Masukkan deskripsi",
            controller: captionController,
            inputType: TextInputType.multiline,
          ),
          const SizedBox(
            height: 9,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 30,
                width: 85,
                child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: blueColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: () {
                      if (validate()) {
                        _submitData();
                      }
                    },
                    child: Text(
                      "Request",
                      style: whiteTextStyle.copyWith(
                          fontSize: 10, fontWeight: FontWeight.w500),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
