Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/6] module: add support for symbol namespaces.
From: Martijn Coenen <maco@android.com>
Message-Id: <CAB0TPYHu2tDuefRCfdUd_A8XqRQ_ym811ua-Cu3C=xUPnyHTGw@mail.gmail.com>
Date: Tue, 24 Jul 2018 09:44:25 +0200
To: Jessica Yu <jeyu@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Oliver Neukum <oneukum@suse.com>, Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@codeaurora.org>, Philippe Ombredanne <pombredanne@nexb.com>, Kate Stewart <kstewart@linuxfoundation.org>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>, USB list <linux-usb@vger.kernel.org>, USB Storage list <usb-storage@lists.one-eyed-alien.net>, linux-scsi@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, Martijn Coenen <maco@google.com>, Sandeep Patil <sspatil@google.com>, Iliyan Malchev <malchev@google.com>, Joel Fernandes <joelaf@google.com>
List-ID: <linux-usb.vger.kernel.org>

T24gTW9uLCBKdWwgMjMsIDIwMTggYXQgMToxMiBQTSwgSmVzc2ljYSBZdSA8amV5dUBrZXJuZWwu
b3JnPiB3cm90ZToKPiBJTU8gSSBkb24ndCB0aGluayB3ZSBzaG91bGQgYmVuZCBvdmVyIGJhY2t3
YXJkcyB0byBhY2NvbW1vZGF0ZQo+IG91dC1vZi10cmVlIG1vZHVsZXMgLSBtb2RpZnlpbmcgdGhl
IG1vZHVsZSBsb2FkZXIgdG8gcmVjb2duaXplIGV2ZW4KPiBtb3JlIHNwZWNpYWwgc2VjdGlvbnMg
dG8gYWNjb21tb2RhdGUgdGhlc2UgT09UIG1vZHVsZXMgd291bGQgYmUgd2hlcmUKPiB3ZSdkIGRy
YXcgdGhlIGxpbmUgSSB0aGluay4KCkkgYWdyZWUgd2l0aCB5b3UsIEkgcmVhbGx5IGRvbid0IGxp
a2UgbWFraW5nIHRoZSBtb2R1bGUgbG9hZGVyIG1vcmUKY29tcGxleCAod2hpY2ggaXMgd2h5IEkg
ZGlkbid0IG9wdCB0byBjcmVhdGUgc2VwYXJhdGUgc2VjdGlvbnMgaW4gdGhlCmZpcnN0IHBsYWNl
KSwgYW5kIGluIHRoZSBlbmQgdGhpcyBjaGFuZ2Ugd2lsbCBpbiBzb21lIHdheXMgYmVuZWZpdApv
dXQtb2YtdHJlZSBkcml2ZXJzIHRvbywgZXZlbiB0aG91Z2ggaXQgd2lsbCBiZSBhIGJpdCBwYWlu
ZnVsIG5vdy4KCj4gSSB0aGluayBnb2luZyBmb3J3YXJkIEkgd291bGQgcHJlZmVyIHRvIGhhdmUg
ZXhwb3J0IG5hbWVzcGFjZXMgdG8gYmUgYQo+IG5vcm1hbCBhbmQgcmVndWxhciBwYXJ0IG9mIGtl
cm5lbCBBUEkgKGFzIGluLCB3ZSBzaG91bGRuJ3QgcmVxdWlyZSBhCj4gbmV3IG9wdGlvbiBmb3Ig
aXQpLCBhbmQgdGhhdCB0aGUgd2FybmluZ3MgZm9yIDEtMiBjeWNsZXMgYXJlIGNvdXJ0ZW91cwo+
IGVub3VnaCAtIGJ1dCBhbnlvbmUgd2l0aCBzdHJvbmdlciBvcGluaW9ucyBhYm91dCB0aGlzIHNo
b3VsZCBzcGVhayB1cC4KClRoYXQgYWxpZ25zIHdpdGggaG93IEkgdGhpbmsgYWJvdXQgdGhpczsg
aWYgd2Ugd2FudCB0aGlzIHRvIGJlIGEKc3RhbmRhcmQgdGhpbmcgaW4gdGhlIGtlcm5lbCwgd2Ug
c2hvdWxkIGF0IHNvbWUgcG9pbnQgZW5mb3JjZSBpdCwKYmVjYXVzZSBpdCdzIHByZXR0eSBlYXN5
IHRvIGlnbm9yZSB0aGUgd2FybmluZy4gVGhlIGdvb2QgdGhpbmcgaXMgdGhhdAppdCdzIG5vdCBh
IGJpZyBvbi9vZmYgc3dpdGNoLCBidXQgc3Vic3lzdGVtIG1haW50YWluZXJzIGNhbiBqdXN0Cmlu
dHJvZHVjZSBuYW1lc3BhY2VzIHdoZW4gaXQgbWFrZXMgc2Vuc2UuCgpUaGFua3MsCk1hcnRpam4K
Cj4KPiBUaGFua3MsCj4KPiBKZXNzaWNhCi0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlz
dDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3JpYmUgbGludXgtdXNiIiBpbgp0aGUgYm9keSBvZiBh
IG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZv
IGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK
