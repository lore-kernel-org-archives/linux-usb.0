Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v6,85/99] btrfs: Remove unused spinlock
From: David Sterba <dsterba@suse.cz>
Message-Id: <20180118142234.GK13726@twin.jikos.cz>
Date: Thu, 18 Jan 2018 15:22:34 +0100
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <mawilcox@microsoft.com>, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-nilfs@vger.kernel.org, linux-btrfs@vger.kernel.org, linux-xfs@vger.kernel.org, linux-usb@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, iommu@lists.linux-foundation.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, intel-gfx@lists.freedesktop.org, cgroups@vger.kernel.org, linux-sh@vger.kernel.org, David Howells <dhowells@redhat.com>
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBKYW4gMTcsIDIwMTggYXQgMTI6MjE6NDlQTSAtMDgwMCwgTWF0dGhldyBXaWxjb3gg
d3JvdGU6Cj4gRnJvbTogTWF0dGhldyBXaWxjb3ggPG1hd2lsY294QG1pY3Jvc29mdC5jb20+Cj4g
Cj4gVGhlIHJlYWRhX2xvY2sgaW4gc3RydWN0IGJ0cmZzX2RldmljZSB3YXMgb25seSBpbml0aWFs
aXNlZCwgYW5kIG5vdAo+IGFjdHVhbGx5IHVzZWQuICBUaGF0J3MgZ29vZCBiZWNhdXNlIHRoZXJl
J3MgYW5vdGhlciBsb2NrIGFsc28gY2FsbGVkCj4gcmVhZGFfbG9jayBpbiB0aGUgYnRyZnNfZnNf
aW5mbyB0aGF0IHdhcyBxdWl0ZSBoZWF2aWx5IHVzZWQuICBSZW1vdmUKPiB0aGlzIG9uZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IFdpbGNveCA8bWF3aWxjb3hAbWljcm9zb2Z0LmNvbT4K
CkknbGwgcGljayB0aGlzIG9uZSBub3csIHRoYW5rcy4KLS0tClRvIHVuc3Vic2NyaWJlIGZyb20g
dGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC11c2IiIGluCnRoZSBi
b2R5IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCk1vcmUgbWFqb3Jk
b21vIGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbAo=
