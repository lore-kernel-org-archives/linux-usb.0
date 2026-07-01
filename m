Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6413F871E;
	Wed,  1 Jul 2026 09:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782898923; cv=none; b=R254e1ISEsIp24cqGz5Gg3t2gAcA7EYW0yk4Kt7K8e4s/BNT4POELWr+aY76pkusgRhAeFq3yvi1ZALGXDqhG/wuRDCSRVFofYt3c8pKLo6Irnk1ew5iVTvVz2BboQ1nJQZ6JTWXJbPZYvlRxY8axpUEcsomEgyrhgJcBBy/ojw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782898923; c=relaxed/simple;
	bh=ykSx3Iyf5SYJ/MT+bZLkSucKcIy96W68ZzI+rwUrpJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o1xVXeMFw3QM1BvqI8Ap2zXnzIp4W+kxA+nnu6XVUdATpqjUfVnUONtxUup2UH/gluH2Ks9QkeqxgMBNp3oMXUErzCh1kddFNN5Upj5n9iY0hIvQRX93fQv831lYSFc6vav5F4oF6ySu0cRanixtWRIE+IfenkQD3Qtk2RSd7TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HAZHD6Ug; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HAZHD6Ug"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC221F00A3A;
	Wed,  1 Jul 2026 09:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782898921;
	bh=bfrBSekSNIKWuBi4Run4vwyC5pfX+76l6DS1k9tedGc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HAZHD6UgoMHQNw28yxhRXLw3L4JiyHCrMUrVvx1hL+lAVQ9PsRsRikXwXmlZFIf3N
	 Ndo7fKU8cb/4m7EOZayRv+DOa/4Ra95cq7R4gOa4UmE2RcPBu7vLZ8CIHMQZx9M2Nx
	 3AtF3hmHm8Qq+Sq8NG1DdSmHb1FwirJtQXvFIegRMDNTsD+4GY9NNx0ZIQlFKIhmmG
	 m/6KocRgo9Yfh8u7Wd6jroGBwMHip7IlP1SWqS4YqfsiDkjtuy53+ttnYjwhjTeXVm
	 qIe3mNBce7mbq5dMwXG/n9Ni59jwnfpRc4qH4ZVwyQbJ2TxUuBtaqrO79/awlk4TCD
	 4dNbai4wedayQ==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Wed, 01 Jul 2026 12:41:50 +0300
Subject: [PATCH v2 1/2] usb: host: ohci-dbg: use kmalloc() for print buffer
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-b4-usb-v2-1-272807df4b64@kernel.org>
References: <20260701-b4-usb-v2-0-272807df4b64@kernel.org>
In-Reply-To: <20260701-b4-usb-v2-0-272807df4b64@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mike Rapoport <rpppt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linux-usb@vger.kernel.org, 
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>
X-Mailer: b4 0.16-dev

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

While on it, drop the NULL checks in debug_close(). buf is never NULL
here because all the open handlers return -ENOMEM when alloc_buffer()
fails, and kfree() can handle a NULL buf->page.

Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 drivers/usb/host/ohci-dbg.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/ohci-dbg.c b/drivers/usb/host/ohci-dbg.c
index 9e0e06bbc570..23dc9eddc06c 100644
--- a/drivers/usb/host/ohci-dbg.c
+++ b/drivers/usb/host/ohci-dbg.c
@@ -683,7 +683,7 @@ static int fill_buffer(struct debug_buffer *buf)
 	int ret;
 
 	if (!buf->page)
-		buf->page = (char *)get_zeroed_page(GFP_KERNEL);
+		buf->page = kzalloc(PAGE_SIZE, GFP_KERNEL);
 
 	if (!buf->page) {
 		ret = -ENOMEM;
@@ -729,11 +729,8 @@ static int debug_close(struct inode *inode, struct file *file)
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

-- 
2.53.0

