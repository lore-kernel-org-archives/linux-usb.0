Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02E63EFD37;
	Tue, 30 Jun 2026 10:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815240; cv=none; b=VV2ax8iOav7CYrIZkq0Fv+kcY+1GWJaeXwIwjByhHFgEWeQbR2t9UM6+SuVNQRzF9laP4NED/LA1IMCRhFoo5i0gJbyRZzReoy4iLJnBDQ55aTLmCZmbkTxxdd1rGJgHrqWz404XNGdNAo83ALvCNsTxRuSVSUPks4WeLTmzEUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815240; c=relaxed/simple;
	bh=0U8ZgBNdHWb7Vg/0MUwaxiiK0nuu+gTlBPMVk1nPOK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YIgljGkLGBWDbwi6ztYgwZRZgFBbXG1mGBhA/kZ0epdEgypQUHzskJXbdlVftgca+MG9wwNMAI0+4vTSxi5bsoZ3sIH1ZXuOaHVVMQWrJibH1VUWajMyJeKbu1zxX97gATO1ycUYMjai0D9LA6kXI6BIJ4aC8AN5m4Eow0t+Gf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GFDNMXG6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GFDNMXG6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3F41F00A3A;
	Tue, 30 Jun 2026 10:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782815239;
	bh=patmpnVmYGTOpRCqMyGDpkqFj5MsIg2HEN2E1VwU2Hc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GFDNMXG66ssR/fsB+/hwGXiru/uXpVJ/rPeKW4ReYyUg10ebLRY7d9OSbJRyrQe7J
	 S7nbUbcEnMR97DSNKEvsUtDyAtrrOlbGOpBgM+e68dI5RJlnejphJYnLrrh6LuJNU3
	 ToDrJkLWv1dRjVcprSL5eA/T7AeJDJFi8XadYWmlKwbokMjNRHc7LCYLhi6h5MTy/0
	 gIzAuNER+omqaAXhMtCI1L5J3VYZLzT4RyYexWRfeIuvhseeJRjZkeUOzwaUdMwAdj
	 B11/JvUl/hkXISvm/v+cJwAXbCm2/hesVJwTvDbxF37Khkaye09acR41UpZipCSiN9
	 K9yw9kw7/N6vg==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 30 Jun 2026 13:27:08 +0300
Subject: [PATCH 1/2] usb: host: ohci-dbg: use kmalloc() for print buffer
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-b4-usb-v1-1-8d547235c374@kernel.org>
References: <20260630-b4-usb-v1-0-8d547235c374@kernel.org>
In-Reply-To: <20260630-b4-usb-v1-0-8d547235c374@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mike Rapoport <rpppt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linux-usb@vger.kernel.org, 
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>
X-Mailer: b4 0.15.2

ochi-dbg allocates buffers for formatting of various dump outputs.

These buffers can be allocated with kmalloc() as there's nothing special
about them to go directly to the page allocator.

kmalloc() provides a better API that does not require ugly casts and
kfree() does not need to know the size of the freed object.

Performance difference between kmalloc() and __get_free_pages() is not
measurable as both allocators take an object/page from a per-CPU list for
fast path allocations.

For the slow path the performance is anyway determined by the amount of
reclaim involved rather than by what allocator is used.

Replace use of get_zeroed_page() with kzalloc() and free_page() with
kfree().

While on it, make kfree() calls unconditional since kfree() can be passed a
NULL pointer.

Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 drivers/usb/host/ohci-dbg.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/ohci-dbg.c b/drivers/usb/host/ohci-dbg.c
index 9e0e06bbc570..0a648a7d9136 100644
--- a/drivers/usb/host/ohci-dbg.c
+++ b/drivers/usb/host/ohci-dbg.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-1.0+
+#include <linux/slab.h>
 /*
  * OHCI HCD (Host Controller Driver) for USB.
  *
@@ -683,7 +684,7 @@ static int fill_buffer(struct debug_buffer *buf)
 	int ret;
 
 	if (!buf->page)
-		buf->page = (char *)get_zeroed_page(GFP_KERNEL);
+		buf->page = kzalloc(PAGE_SIZE, GFP_KERNEL);
 
 	if (!buf->page) {
 		ret = -ENOMEM;
@@ -729,11 +730,8 @@ static int debug_close(struct inode *inode, struct file *file)
 {
 	struct debug_buffer *buf = file->private_data;
 
-	if (buf) {
-		if (buf->page)
-			free_page((unsigned long)buf->page);
-		kfree(buf);
-	}
+	kfree(buf->page);
+	kfree(buf);
 
 	return 0;
 }
@@ -782,4 +780,3 @@ static inline void remove_debug_files (struct ohci_hcd *ohci)
 }
 
 /*-------------------------------------------------------------------------*/
-

-- 
2.53.0

