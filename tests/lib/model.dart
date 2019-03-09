import 'my_card.dart';
import 'card_page.dart';

class Planet {
  final String id;
  final String name;
  final String location;
  final String distance;
  final String gravity;
  final String description;
  final String image;
  final String picture;

  const Planet({this.id, this.name, this.location, this.distance, this.gravity,
    this.description, this.image, this.picture});
}

List<Planet> planets = [
  const Planet(
      id: "1",
      name: "Такси",
      location: "velivok",
      distance: "54.6m Km",
      gravity: "900",
      description: "Случились в моей жизни перемены, сменил работу,  завел кота, да не просто кота. Когда выбирали кота, девушка наткнулась на объявление слепой кот пушик, ну и влюбилась. Несмотря на моё довольно скептическое настроение - поехали знакомиться. В первые 5 минут это слепой комок любви залез мне под куртку, на плечо, мило пурчал... В общем у меня теперь киса, милая ласковая туша в 6 месяцев весит 3.5 кг) С глазами всё оказалось хуже чем казалось, пришлось удалять левый глаз. День ожидания и стресса и вот я вызываю такси из клиники, на нервах и эмоциях дурак забыл написать комментарий о коте в переноске. Приехал таксист, сели, начали поездку и тут понеслось. Сначала претензия о том что не предупредил о коте, извинился, выяснили что аллергии у него нет, а если б была, то я бы отменил поездку, заплатил бы за её отмену и вызвал другую машину. И тут нам выдают: -100 рублей сверху за кота. - на каком основании? -ваш договор с убером, там есть пункт о изменении стоимости и возможной оплаты напрямую таксисту. Я таксист, у меня лицензия, я все знаю! Лезу в пользовательское соглашение, выхожу на федеральные законы о перевозке, ни где нет указаний об доплате. Наоборот, уточнение о том что цена финальная и не меняется, дополнительная оплата возможна лишь за химчистку салона и необходимый ремонт по вине пассажира.- Нет, я таксист, я знаю! Это есть в соглашение с яндекс, убер этож яндекс!!! Лезу туда, там так же ничего про 100 рублей. Как итог 40 минут пути вместо 20, т.к. он зачем-то ехал окольными путями. Всё это под бесконечное нытье о том как плохо работать на яндекс, как все пытаются обмануть честного работягу таксиста в его лице, да еще и пассажиры дохера умные пошли. Да, в этой ситуации я был немного не прав, т.к. забыл указать что еду с котом, но попытка развести людей на оплату мимо кассы в обход налоговой, как минимум незаконна. После одного недавнего поста я понял что тот водитель по всей видимости фанат торговца бахилами.",
      image: "images/mars.png",
      picture: "https://www.nasa.gov/sites/default/files/thumbnails/image/pia21723-16.jpg"
  ),
  const Planet(
      id: "2",
      name: "Добрая история из жизни",
      location: "poorcastiel",
      distance: "54.6m Km",
      gravity: "267",
      description:"В прошлом году на майские праздники летала с подругой в Берлин. Знание немецкого языка нулевое, да и английский разговорный не идеален. Поэтому, придя в какую-то кафешку, мы просто тыкали пальцем в витрину и обходились всего двумя фразами: this и thank you, украшая их улыбками. Делали так и в полюбившейся нам пиццерие, которую посещали раз в день-два. Последний день двухнедельного отпуска. Долго спорили с подругой, кто из нас в этот раз будет тыкать, в итоге, эта великая роль досталась ей. С важным видом, она подходит к витрине, за которой стоит привлекательный пиццайоло, и произносит: this и this. Он стоит, смотрит на неё и, наконец, спрашивает: вам как, с собой?. на идеальном, мать его, русском :D Долго пытались у него разузнать из какой он страны, откуда так хорошо знает русский, и почему лишь на наше десятое посещение он вдруг решил расколоться. Ответил, что русского не знает, а нам всё это мерещиться. От голода. И подарил нам пиццу, чтобы мы поскорее приходили в себя. Добро :)",
      image: "images/mars2.png",
      picture: "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/images/110411main_Voyager2_280_yshires.jpg"
  ),
//  const Planet(
//      id: "3",
//      name: "Moon",
//      location: "Milkyway Galaxy",
//      distance: "54.6m Km",
//      gravity: "3.711 m/s ",
//      description: "The Moon is an astronomical body that orbits planet Earth, being Earth's only permanent natural satellite. It is the fifth-largest natural satellite in the Solar System, and the largest among planetary satellites relative to the size of the planet that it orbits (its primary). Following Jupiter's satellite Io, the Moon is second-densest satellite among those whose densities are known.",
//      image: "images/mars.png",
//      picture: "https://farm5.staticflickr.com/4086/5052125139_43c31b7012.jpg"
//  ),
//  const Planet(
//      id: "4",
//      name: "Earth",
//      location: "Milkyway Galaxy",
//      distance: "54.6m Km",
//      gravity: "3.711 m/s ",
//      description: "Earth is the third planet from the Sun and the only object in the Universe known to harbor life. According to radiometric dating and other sources of evidence, Earth formed over 4 billion years ago. Earth's gravity interacts with other objects in space, especially the Sun and the Moon, Earth's only natural satellite. Earth revolves around the Sun in 365.26 days, a period known as an Earth year. During this time, Earth rotates about its axis about 366.26 times.",
//      image: "images/mars.png",
//      picture: "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/iss042e340851_1.jpg"
//  ),
//  const Planet(
//      id: "5",
//      name: "Mercury",
//      location: "Milkyway Galaxy",
//      distance: "54.6m Km",
//      gravity: "3.711 m/s ",
//      description: "Mercury is the smallest and innermost planet in the Solar System. Its orbital period around the Sun of 88 days is the shortest of all the planets in the Solar System. It is named after the Roman deity Mercury, the messenger to the gods.",
//      image: "images/mars.png",
//      picture: "https://c1.staticflickr.com/9/8105/8497927473_2845ae671e_b.jpg"
//  ),
];