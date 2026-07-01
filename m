Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089A73F0AA6;
	Wed,  1 Jul 2026 09:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782898932; cv=none; b=Wq9m8u2LkGsKXpGkTC0vjeSIH8PH1X1K6QQO6J9D3ffaE0WPWOUsyMwCK0fMMxHeOaqluw8Q4GIAOE7Dn5SoGu9VZwm52TLSJISSHvbrFseiPNoAo9mh1qSVEhzRayfwPVPaT4QibofJ9QMphyXKSi/tBHVe6wPvJZmq0pQt2to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782898932; c=relaxed/simple;
	bh=ZGwjwPbxhwWs0vTl7OH/4jwIBZgLtnEVRosMNacn0c0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JNyP531wnwmdq2iKu9YPaWr9PFXM2qf96QFuJdcyUx0JjaKON6osTeRuF3HqzSmXdAg2Dnx7kAkDMg4sulP8P6VW6ynRI9qlQb6Zyv5YOdks3KjoPo2hSLe/HOfRpKNJm3/QPFIWSJ47LnqHR2fYAIftAAWwZSSWorNazjCvFUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OIHblCl3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OIHblCl3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E68A1F00A3F;
	Wed,  1 Jul 2026 09:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782898923;
	bh=oofkD0xPKEf9vCnFp/Y6xC9zUcU++9G9r0ci+L1ELF4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OIHblCl3HCNczmG+b75ItOq2+mwAyrrJ/gm+hyonolZEUllMNHcUWun1Fn9vBt1Oa
	 bvuhMy8BdS1+TAayGPVntvd8agcnyqcL5HehCJporv52MjaB0B/Bj80+Cx6JMzFy4N
	 d+3YuFXiLEcKsZiJaq2OtbwdGF58sgXZaz1jr1Kmdg8Ez+hrAmtiSvYs1oGadrYmcE
	 PbjHkp3H+F/NKzRhMVMVudHJFu0bxrwsi9kviFxNJbo5J9vFbOTXV4amxQE7+xzjEi
	 st+I3icZd8s+DnofgG136KZ07LueNOA9GLc46GsUtWmaSZHqUGFejrn1aOjzFXuOem
	 we3wjumT1HMfA==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Wed, 01 Jul 2026 12:41:51 +0300
Subject: [PATCH v2 2/2] usb: core: devices: use kmalloc() to allocate dump
 buffer
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-b4-usb-v2-2-272807df4b64@kernel.org>
References: <20260701-b4-usb-v2-0-272807df4b64@kernel.org>
In-Reply-To: <20260701-b4-usb-v2-0-272807df4b64@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mike Rapoport <rpppt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linux-usb@vger.kernel.org, 
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>
X-Mailer: b4 0.16-dev

usb_device_dump() allocates a buffer for formatting
/sys/kernel/debug/usb/devices output text.

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
Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
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

