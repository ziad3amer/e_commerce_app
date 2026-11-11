// Row(
//   mainAxisAlignment:
//   MainAxisAlignment.spaceBetween,
//   children: [
//     const Text(
//       "Popular Products",
//       style: TextStyle(
//         fontSize: 17,
//         fontWeight: FontWeight.w700,
//         color: Color(0xFF111827),
//       ),
//     ),
//     TextButton(
//       onPressed: () {
//         setState(() {
//           selectedCategory = "All";
//         });
//       },
//       child: const Text(
//         "See All",
//         style: TextStyle(
//           color: Color(0xFF10B981),
//         ),
//       ),
//     ),
//   ],
// ),
// const SizedBox(height: 8),
// Expanded(
//   child: GridView.builder(
//     itemCount: filteredProducts.length,
//     gridDelegate:
//     const SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 2,
//       crossAxisSpacing: 12,
//       mainAxisSpacing: 12,
//       childAspectRatio: 0.72,
//     ),
//     itemBuilder: (context, index) {
//       final product =
//       filteredProducts[index];
//
//       return Container(
//         padding:
//         const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius:
//           BorderRadius.circular(20),
//           border: Border.all(
//             color: const Color(0xFFE5E7EB),
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment:
//           CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Center(
//                 child: Image.network(
//                   product.thumbnail,
//                   fit: BoxFit.contain,
//                   errorBuilder: (
//                       context,
//                       error,
//                       stackTrace,
//                       ) {
//                     return const Icon(
//                       Icons
//                           .image_not_supported,
//                     );
//                   },
//                 ),
//               ),
//             ),
//
//             const SizedBox(height: 8),
//
//             Text(
//               product.title,
//               maxLines: 1,
//               overflow:
//               TextOverflow.ellipsis,
//               style: const TextStyle(
//                 fontWeight:
//                 FontWeight.w700,
//                 fontSize: 14,
//               ),
//             ),
//
//             const SizedBox(height: 6),
//
//             Row(
//               children: [
//                 const Icon(
//                   Icons.star,
//                   color: Colors.amber,
//                   size: 17,
//                 ),
//                 const SizedBox(width: 4),
//                 Text(
//                   product.rating.toString(),
//                   style: const TextStyle(
//                     color: Colors.grey,
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//
//             const SizedBox(height: 8),
//
//             Text(
//               "\$${product.price}",
//               style: const TextStyle(
//                 fontWeight:
//                 FontWeight.w800,
//                 fontSize: 15,
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   ),
// ),