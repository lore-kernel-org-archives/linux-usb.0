Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACCC3C1D62
	for <linux-usb@vger.kernel.org>; Sat, 19 Sep 2026 09:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789808848; cv=none; b=XKmAZc7LZSwVW39wgkwB3RPq3KAGyXmzGVOVaGwX9HyNWa8q9XszThJZlmlw9GVQdGM5G70diTTTCWJLzrplEbM693ANUPsMeuJQQ/qkE0IJM/W51xCSLvHb6PaMWjPQIwG0P2kOSHq6HZ+UDi95ijVyUyktLwFJnZ3EZwJ3YDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789808848; c=relaxed/simple;
	bh=oNw+8ORcU5KuL0YV9z2oy7S4xWQTlijjw3DyQFtFOMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hk3hxlXnSD4mqSPv/ttxi6jznFYSNUNMeCs49ZE4wMFHKUmwMIRV3TuQeID2S03KlGuit//TNh939Vt1wMroEdJblKxXiVlFeh0j7YPSFkdsgPW+zStF65CI7/TIvizi9F/+IXjILIqeLeAfzrh3mncxNh7yzgUQIrW7Kw2XImE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDAmxfCE; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDAmxfCE"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469b355ffso965366b3a.1
        for <linux-usb@vger.kernel.org>; Sat, 19 Sep 2026 02:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789808846; x=1790413646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w0054VWi5/RTL0jJWEqh7qzJLDYZnlLI6cq03NqyKkg=;
        b=bDAmxfCEvg51RJc6wP6kQjPrRu+UArlkkNJGqQteu5lHSxmzjaWkCYnz4RKOh7/XfA
         rPAtNKZFksdtqSXBMxYczZOG/DIEndtxmAfrlaTBMC99V059byLrkO7dQn4F8xUQGJKw
         nrKmG2FT0DhderRTBjI4KtcXaWTignvV+AJC7B32rOvTP/GcPxBgJE+DvQ5vp1SOl/Tf
         qGWdCtVaM3o2jRxKVxtzWh6bZ+47EeI1GxwIp6kr0w8ywvMWw3JedKb9g+n3cTV8rEm3
         Al4+qW2A3n0JiD7eBNqiMAqkaWOCVUHD8Q2Y0KO7zEcZSOhyMieChhC7REBBrXQgA4E5
         VTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789808846; x=1790413646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w0054VWi5/RTL0jJWEqh7qzJLDYZnlLI6cq03NqyKkg=;
        b=U9oH/wmrIKuIlToxVNBmqDDrEBQ8abx3svGPYuaaLIk8I1ofa4pIy86KSpV75gD5G7
         YzWl7TrZL6sYGiad3avYio3i1bHF2iEM+iVHJeYOYv4LjL0u0EtOp+O3s9cjMAIiY325
         u2tRZQObGykpTNyc9E567I+xd42sHlkBfYGW4LmSkfMcVKVMEaU+H8jdSmiaUsOeBvzA
         5NEQzyqx3BxL7sE2vJRMUmupim0/Qey2pJQzSadM9jaymZ688bJGLNEw6VQWSnWPxMh7
         DUOs6bz3NdeHtd8M97G69zP7IYM0dcbbBIbAPW3vDdN6qV9iCWArT4rNeC9g5C2pT9gQ
         IX8A==
X-Gm-Message-State: AFuF++khQMf6QRaiab/Gn6O4QO2jai976C/Yr912HvKyNnK7dXUZqHpC
	RmoM66y8/J43Fo1nVBN8lMKP0LSMinD9kLklj4BzhZEvRNqs3bpLSyJ0
X-Gm-Gg: AYBFou1qW/NxKDdNeDJrpx45YRTEuMUR/Dl/LGKiQwj4z1iDdkuvve0CQrBiTxGIaaF
	4Ilhn53E5G0PtdAenus+d+FMgzQkAW2DgfBbpS2pIJ+epqSDZQAVaoY5W9P+wnmovRZu4CiCCvO
	HoUuwy73XqhtvaNc8ZhehnezMKeoW41YoUUEE+WN9ohhE6IpFG3gKB+eubSHbrJzI/9YMuWWu+X
	i7NzEt8/vMXy8XuCWM6nqVQ8ChbGptfTgP7i7OJGjqeiWPOBwWfIxPcp3YYedv60RBc+NqZIPo/
	GoxhLJyOz+G9yhxntJHeNWtYkg+NPbma7SCSO42UYe23Dr/0RdtIcZAQ8tu06B818ZRn36ixni7
	ZnNAm8i6VJpk/FRqGKPvup4mL2IaxeHtGc4EjlMZ5801ArheVVZsB4XUOuGLyZY3XVHwnIog1Fg
	YjY25oReb+AMy45F7ImPFAZLGo01QuJmnv4oFCXAROJ83j0dmK94cSDPi3a+l4PzYnDKVrFxUo6
	7kJhZxJVj6gXpqNTVlkJpCydrzoPsZrn0iZpUgGoMZgBNWILGVxLf6M8edbSxVIpL6sp3nZCLWY
	Im1ujCB+sQ==
X-Received: by 2002:a05:6a20:728d:b0:3d3:ad3c:49a5 with SMTP id adf61e73a8af0-3dd8c516af5mr9104443637.19.1789808846042;
        Sat, 19 Sep 2026 02:07:26 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72a26d5casm754712a12.0.2026.09.19.02.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 02:07:25 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH 1/2] usb: gadget: f_hid: don't call copy_from_user() under get_report_spinlock
Date: Sat, 19 Sep 2026 09:07:23 +0000
Message-ID: <20260919090724.3256109-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

f_hidg_get_report() already copies the incoming struct usb_hidg_report
from userspace into the freshly allocated 'entry' before acquiring
hidg->get_report_spinlock.

When a report with the same report_id is already present in
hidg->report_list, the update path copies from userspace a second time,
this time directly into ptr->report_data while the spinlock is held with
interrupts disabled:

	spin_lock_irqsave(&hidg->get_report_spinlock, flags);
	ptr = f_hidg_search_for_report(hidg, report_id);
	if (ptr) {
		if (copy_from_user(&ptr->report_data, buffer,
				sizeof(struct usb_hidg_report))) {

copy_from_user() may fault and sleep, so this is a sleeping function
called from atomic context, reported by CONFIG_DEBUG_ATOMIC_SLEEP as
"BUG: sleeping function called from invalid context". Userspace can
reach it at will by issuing GADGET_HID_WRITE_GET_REPORT twice with the
same report_id on /dev/hidgN.

The second copy is also redundant: the same user buffer has already been
copied into entry->report_data a few lines above, and report_id was
derived from that copy. Assign from the already copied data instead,
which removes the fault from the critical section and makes the update
atomic with respect to the list lookup.

Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Found by inspection while investigating the use-after-free fixed in
patch 2/2, and build tested only; I do not have HID gadget hardware,
but the path is reachable from /dev/hidgN with dummy_hcd.

 drivers/usb/gadget/function/f_hid.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -668,13 +668,7 @@ static int f_hidg_get_report(struct file
 
 	if (ptr) {
 		/* Report already exists in list - update it */
-		if (copy_from_user(&ptr->report_data, buffer,
-				sizeof(struct usb_hidg_report))) {
-			spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
-			ERROR(cdev, "copy_from_user error\n");
-			kfree(entry);
-			return -EINVAL;
-		}
+		ptr->report_data = entry->report_data;
 		kfree(entry);
 	} else {
 		/* Report does not exist in list - add it */
-- 
2.43.0
