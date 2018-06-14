Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,04/27] docs: fix broken references with multiple hints
From: Steven Rostedt <rostedt@goodmis.org>
Message-Id: <20180614122737.4044a2b7@gandalf.local.home>
Date: Thu, 14 Jun 2018 12:27:37 -0400
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Harry Wei <harryxiyou@gmail.com>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Roy Pledge <Roy.Pledge@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Ingo Molnar <mingo@redhat.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@zh-kernel.org, linux-usb@vger.kernel.org, linux-input@vger.kernel.org, devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org, linux-security-module@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCAxNCBKdW4gMjAxOCAxMzowODo0OSAtMDMwMApNYXVybyBDYXJ2YWxobyBDaGVoYWIg
PG1jaGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPiB3cm90ZToKCj4gKysrIGIvRG9jdW1lbnRhdGlv
bi90cmFjZS9ldmVudHMucnN0Cj4gQEAgLTgsNyArOCw3IEBAIEV2ZW50IFRyYWNpbmcKPiAgMS4g
SW50cm9kdWN0aW9uCj4gID09PT09PT09PT09PT09PQo+ICAKPiAtVHJhY2Vwb2ludHMgKHNlZSBE
b2N1bWVudGF0aW9uL3RyYWNlL3RyYWNlcG9pbnRzLnR4dCkgY2FuIGJlIHVzZWQKPiArVHJhY2Vw
b2ludHMgKHNlZSBEb2N1bWVudGF0aW9uL3RyYWNlL3RyYWNlcG9pbnRzLnJzdCkgY2FuIGJlIHVz
ZWQKPiAgd2l0aG91dCBjcmVhdGluZyBjdXN0b20ga2VybmVsIG1vZHVsZXMgdG8gcmVnaXN0ZXIg
cHJvYmUgZnVuY3Rpb25zCj4gIHVzaW5nIHRoZSBldmVudCB0cmFjaW5nIGluZnJhc3RydWN0dXJl
Lgo+ICAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFjZS90cmFjZXBvaW50LWFuYWx5
c2lzLnJzdCBiL0RvY3VtZW50YXRpb24vdHJhY2UvdHJhY2Vwb2ludC1hbmFseXNpcy5yc3QKPiBp
bmRleCBhNGQzZmYyZTVlZmIuLmJlZjM3YWJmNGFkMyAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL3RyYWNlL3RyYWNlcG9pbnQtYW5hbHlzaXMucnN0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi90
cmFjZS90cmFjZXBvaW50LWFuYWx5c2lzLnJzdAo+IEBAIC02LDcgKzYsNyBAQCBOb3RlcyBvbiBB
bmFseXNpbmcgQmVoYXZpb3VyIFVzaW5nIEV2ZW50cyBhbmQgVHJhY2Vwb2ludHMKPiAgMS4gSW50
cm9kdWN0aW9uCj4gID09PT09PT09PT09PT09PQo+ICAKPiAtVHJhY2Vwb2ludHMgKHNlZSBEb2N1
bWVudGF0aW9uL3RyYWNlL3RyYWNlcG9pbnRzLnR4dCkgY2FuIGJlIHVzZWQgd2l0aG91dAo+ICtU
cmFjZXBvaW50cyAoc2VlIERvY3VtZW50YXRpb24vdHJhY2UvdHJhY2Vwb2ludHMucnN0KSBjYW4g
YmUgdXNlZCB3aXRob3V0Cj4gIGNyZWF0aW5nIGN1c3RvbSBrZXJuZWwgbW9kdWxlcyB0byByZWdp
c3RlciBwcm9iZSBmdW5jdGlvbnMgdXNpbmcgdGhlIGV2ZW50Cj4gIHRyYWNpbmcgaW5mcmFzdHJ1
Y3R1cmUuCj4gIAoKQWNrZWQtYnk6IFN0ZXZlbiBSb3N0ZWR0IChWTXdhcmUpIDxyb3N0ZWR0QGdv
b2RtaXMub3JnPgoKLS0gU3RldmUKLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBz
ZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC11c2IiIGluCnRoZSBib2R5IG9mIGEgbWVz
c2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCk1vcmUgbWFqb3Jkb21vIGluZm8gYXQg
IGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbAo=
