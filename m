Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,1/2] USB: quirks: Check device interface LPM capability
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20181212113709.GA20058@kroah.com>
Date: Wed, 12 Dec 2018 12:37:09 +0100
To: Kyle Williams <kdgwill@chromium.org>
Cc: linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@linux.intel.com>, Nicolas Boichat <drinkcat@chromium.org>, Jon Flatley <jflat@chromium.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gRnJpLCBEZWMgMDcsIDIwMTggYXQgMDg6NDc6MjFQTSAtMDUwMCwgS3lsZSBXaWxsaWFtcyB3
cm90ZToKPiBGcm9tOiBLeWxlIFdpbGxpYW1zIDxrZGd3aWxsQGNocm9taXVtLm9yZz4KPiAKPiBE
ZXNjcmlwdGlvbjogZW5hYmxlIHRoZSBhYmlsaXR5IHRvIGRpc2FibGUgTFBNIGZvciBhbGwgZGV2
aWNlcyBtYXRjaGVkCj4gYnkgaW50ZXJmYWNlIGluZm9ybWF0aW9uCgpXaHkgaGF2ZSAiRGVzY3Jp
cHRpb246IiBpbiBoZXJlPyAgT2YgY291cnNlIHRoaXMgaXMgdGhlIGRlc2NyaXB0aW9uIDopCgpB
bmQgdGhlIHN1YmplY3QgZG9lc24ndCBtYWtlIG11Y2ggc2Vuc2UsIHdoYXQgZG9lcyB0aGlzIGhh
dmUgdG8gZG8gd2l0aApxdWlya3M/CgpBbHNvLCB5b3UgbmVlZCBtb3JlIGluZm9ybWF0aW9uIGhl
cmUgaW4gdGhlIGRlc2NyaXB0aW9uIGFib3V0IHdoeSB5b3UKYXJlIGRvaW5nIGFsbCBvZiB0aGlz
LCBhcyBpdCBpcywgSSBoYXZlIG5vIGlkZWEgd2h5IHRoaXMgcGF0Y2ggaXMgbmVlZGVkCmF0IGFs
bC4KCnRoYW5rcywKCmdyZWcgay1oCg==
