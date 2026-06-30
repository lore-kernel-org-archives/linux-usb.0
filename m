Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7983F0AAD;
	Tue, 30 Jun 2026 10:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815242; cv=none; b=eTgAKLrbU0jzMWUnbFzVbrpJ8CQwyv9niZM5EeCyPwxC7OKO0J9A5cygfYKL1nQXjWod+F7um5KSaabLGHRkU5AMklFHAP/RrJf07oaVTPoUrvDaDEBYfDUNhNWleC9iaz5KFSxqfMYjYtr1tPnPs6Sh1p8Yl5IDspAMqB1dAGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815242; c=relaxed/simple;
	bh=HfOnIg9z5KglLuVXuGYMCMDdrm6mAm5lg4iWIwltTkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QgGr5QHOmmEJa04ebNhzyy37kDCeefc2VXxqS6qbeG5DGDDJ5Ktzf3iXFpAGOZwz/VtcDESDMFeZlWU+z76z4W7rEM36KfM8DCle6qyA2sduiZklQgTFPdSN551SQ6gV4xEaxbGhhSEVx3FFpb93aGxxHlIkoeKuT7Pf1wnYh0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IKOtE0dF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IKOtE0dF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2EF1F00A3E;
	Tue, 30 Jun 2026 10:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782815241;
	bh=b8xS9p+I1JHNHCRV6gQmZLYib6gO7NPy57088Z5gPbE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IKOtE0dFqcVWl+QfeWVg9zwJTxWZYLSm+0dPa3/CJFCn58V3Lhe02eHmmfrxVAAeY
	 uwsCse1E9otI041t7CCtDhBkpNo2Uw3HaaNZr/YLbz5677AV5C5muTUJWFPIlpqTDq
	 jIv9iQ8hvzDoltVep4XTSH0LRrasAmk4sv0IEb9bmFS5z+ybRG7Zs5ZVbyfDaneRtv
	 ZplSi6qFdm/apgQ2hXibe6iX/lTb3Dx8QJbsz2fJMOcv4saJYORUpIuKQHcjKRd7aj
	 +wva7G3YUzc5vr9YU4ZCseZmrfjcyoa46oRsCDIM5pPdSNVLKYi+DvNYJN61wPq018
	 nzauUMs1j+pTA==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 30 Jun 2026 13:27:09 +0300
Subject: [PATCH 2/2] usb: core: devices: use kmalloc() to allocate dump
 buffer
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-b4-usb-v1-2-8d547235c374@kernel.org>
References: <20260630-b4-usb-v1-0-8d547235c374@kernel.org>
In-Reply-To: <20260630-b4-usb-v1-0-8d547235c374@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mike Rapoport <rpppt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linux-usb@vger.kernel.org, 
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>
X-Mailer: b4 0.15.2

usb_device_dump() allocates a buffer for formatting
/proc/bus/usb/devices output text.

This buffer can be allocated with kmalloc() as there's nothing special
about it to go directly to the page allocator.

kmalloc() provides a better API that does not require ugly casts and
kfree() does not need to know the size of the freed object.

Performance difference between kmalloc() and __get_free_pages() is not
measurable as both allocators take an object/page from a per-CPU list for
fast path allocations.

For the slow path the performance is anyway determined by the amount of
reclaim involved rather than by what allocator is used.

Replace use of __get_free_pages() with kmalloc() and free_pages() with
kfree().

Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 drivers/usb/core/devices.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/devices.c b/drivers/usb/core/devices.c
index a247da73f34d..6f0354aba38b 100644
--- a/drivers/usb/core/devices.c
+++ b/drivers/usb/core/devices.c
@@ -37,6 +37,7 @@
  */
 
 #include <linux/fs.h>
+#include <linux/slab.h>
 #include <linux/mm.h>
 #include <linux/gfp.h>
 #include <linux/usb.h>
@@ -408,7 +409,7 @@ static ssize_t usb_device_dump(char __user **buffer, size_t *nbytes,
 		return 0;
 	/* allocate 2^1 pages = 8K (on i386);
 	 * should be more than enough for one device */
-	pages_start = (char *)__get_free_pages(GFP_NOIO, 1);
+	pages_start = kmalloc(PAGE_SIZE << 1, GFP_NOIO);
 	if (!pages_start)
 		return -ENOMEM;
 
@@ -479,7 +480,7 @@ static ssize_t usb_device_dump(char __user **buffer, size_t *nbytes,
 		if (length > *nbytes)
 			length = *nbytes;
 		if (copy_to_user(*buffer, pages_start + *skip_bytes, length)) {
-			free_pages((unsigned long)pages_start, 1);
+			kfree(pages_start);
 			return -EFAULT;
 		}
 		*nbytes -= length;
@@ -490,7 +491,7 @@ static ssize_t usb_device_dump(char __user **buffer, size_t *nbytes,
 	} else
 		*skip_bytes -= length;
 
-	free_pages((unsigned long)pages_start, 1);
+	kfree(pages_start);
 
 	/* Now look at all of this device's children. */
 	usb_hub_for_each_child(usbdev, chix, childdev) {

-- 
2.53.0

