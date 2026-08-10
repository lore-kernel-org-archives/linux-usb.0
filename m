Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com [203.205.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0177A3AFD1E;
	Mon, 10 Aug 2026 10:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786357548; cv=none; b=eM9MLqK4cmCx3h9jtoRr9V2dInahKxAt0tmIx+v65i3knGWhPEv143sfISXC7lx7hhXu08s73gfyF21/3JcxevKfGUSTZuT4JS1Y9xUH3q3xuASvCncOA3VDFQocolUCJa60qfXpQusQ7FhCHnzIGkYtagJt3yEkSyPkYRtLt+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786357548; c=relaxed/simple;
	bh=OFdKyOqLgHahAhv0hxxF3za+pHHGYEaz7L6XeTNduuc=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=iltbaU7Io/ubqDp7AZpCuIrzGd0zbI7teN8rWnCs2uYg5AF02lZw1ScvDWKIo2ZH8NMLPlNqeHrUtrE5FIjGbo/FsELH1IoOlAawoRPrCj2x9QQ4oOVd0tTsR8tz2ufUhrBpvNDNmvj13IW2HBkiqOBeVqrcjigkHNoXdvzcGIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=MFYOyRpv; arc=none smtp.client-ip=203.205.221.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="MFYOyRpv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1786357536; bh=XYdFTaSJOlhb/N4N7xL3icHdMyXd8Ey4bfCAxrqrtNg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MFYOyRpvkc9yXImsoyN2pr2pxq/Go8gyhZRPfihTgL1ks9uuYXjuy52naWLz0QFJd
	 AqLfZjjldvXqoBWuZdt27m3qUAoOha9fwQjHmZgspbS5levJeEpo6tftM9V7x4jLdP
	 QRKErRG/xT02gFztyvzdQ9pGJL89fJT6PSyrW7fE=
Received: from lxu-ped-host.. ([111.198.231.89])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 6613E86C; Mon, 10 Aug 2026 18:25:33 +0800
X-QQ-mid: xmsmtpt1786357533tn763hipb
Message-ID: <tencent_F5AB9201DDA25D8E1925CF818D87258B8D07@qq.com>
X-QQ-XMAILINFO: OATpkVjS499uyrV04o8dtemYnXgcXxM/oRQT7DWCciuA4xbTmlP/qV64UU/FXS
	 /PTnzuKUeqe/xIOloeK+ar+n/Je4JE66AUyIRKCr24qcXeq5nTcyCYzTqtiEWfVDbLtWsba3bNgm
	 /B8PCEYoI4CFgtV96tG+Ad7QIbbpKjqTuzBFUgaedfif3xGq2AdG+XkmJdm8wa18ZErJfd19XyCt
	 3tms2gpJ2qf6nqIHqwV6BkydhMiInM7ydrXX52pfTf0fWROM0d/4ELMWKzKT69qVeha9ya9kUjUY
	 2rIP1RiD3tKgQofMyLJ5I+pd7U4O6b86Sca9x/4REIkckYxr3cvsp56iYxHI2QUgAn87UJ+IXzvd
	 Ze3Oz3qzUMOaj3+SGDX6WYxFoTs+FqFGaFcKb3dYv9gF/t3/U9hucTsDLsVXrWzhZy5kwwJ5C7Rs
	 rsq5U7VnQgdVjh97XVZ7D5/qO+SQ6BNIPWHkHNgtTUTS0Ybv6FSFlw3+kgWMdk7D8Re7hDJz8IVA
	 tu1PD0lyr+By3XqY9gdsVfurQ6pAPGPld2TM79vQsdjrRQfy0wrv0c+x4Oi7n6G6gdrt2jYLLthY
	 idiL5z/Uxthw0x/F0Y8AM+nndpepzGI3hYq+Fs5ovPaJlfBZGdVBDinp4+q4rQL3FF9uqI7amACH
	 dqJyJPopd43QHQpLz6tDeN6yuNClkgDVyRzfXMmD2G5kXvrYJ6ftRH5Ghpa2ajrBIjuOo0Au4q9I
	 flrYsat75ifHoVe/eOlTToGPhI/MwH9EAInuwbSGmB5vuTsVb93UC5HWYYP4ouVrrRZzMpvp+15H
	 Mlb2JRaucy6KcIxVCwEAR01i1jqU6NWSqGL9VVS4P/4tyJDmIak+T8kz61rW0oqXIvUNXCmEhywx
	 8FGKCAHe7Dnyapsz3uhqDxbWrLso/3zaPgMK75XchH5PW6DXlARpXHwMxGikx0XK5jxN/IaxFSoH
	 suvfrMX0JhnQF+yT0VAqbiG/VKoNy1mhMCLhvI7E5sCW+mZFhlhU1uG13CEEjX7N8LjLifb2/RTR
	 VXBGckwicdU4CpD351xFKlv8jQv+U=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+60740c6a17a5b5eb1f5a@syzkaller.appspotmail.com
Cc: gregkh@linuxfoundation.org,
	david.sands@biamp.com,
	chris.wulff@biamp.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] USB: gadget: f_hid: Release get report req upon unsetup
Date: Mon, 10 Aug 2026 18:25:33 +0800
X-OQ-MSGID: <20260810102533.72490-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6a78d160.01d0871a.3a0d52.0091.GAE@google.com>
References: <6a78d160.01d0871a.3a0d52.0091.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GET_REPORT request instance (hidg->get_req) is freed only within
hidg_disable() after successful binding, and only if Condition [1] is met.

Since userspace does not execute the setup, get_report_workqueue_handler()
is never invoked; consequently, Condition [1] is never met, leading to the
memory leak reported in [2].

The solution is to add memory reclamation for get_req in hidg_unbind(),
using `get_req->length` to determine whether Condition [1] applies.

Additionally, a failure in usb_gstrings_attach() also triggers the issue
reported in [2], so this is fixed at the same time.

[1]
The report is not in the list or should not be sent immediately

[2]
BUG: memory leak
unreferenced object 0xffff888112450300 (size 128):
  backtrace (crc 18381426):
    usb_ep_alloc_request+0x2e/0xd0 drivers/usb/gadget/udc/core.c:197
    hidg_bind+0x2b/0x490 drivers/usb/gadget/function/f_hid.c:1154
    usb_add_function+0xca/0x270 drivers/usb/gadget/composite.c:333
    configfs_composite_bind+0x667/0x9b0 drivers/usb/gadget/configfs.c:1802
    gadget_bind_driver+0xed/0x390 drivers/usb/gadget/udc/core.c:1662


Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IOCTL")
Reported-by: syzbot+60740c6a17a5b5eb1f5a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=60740c6a17a5b5eb1f5a
Tested-by: syzbot+60740c6a17a5b5eb1f5a@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 drivers/usb/gadget/function/f_hid.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 3c6b43d06a6d..8d739e052e68 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -1163,8 +1163,10 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 	/* maybe allocate device-global string IDs, and patch descriptors */
 	us = usb_gstrings_attach(c->cdev, ct_func_strings,
 				 ARRAY_SIZE(ct_func_string_defs));
-	if (IS_ERR(us))
-		return PTR_ERR(us);
+	if (IS_ERR(us)) {
+		status = PTR_ERR(us);
+		goto fail;
+	}
 	hidg_interface_desc.iInterface = us[CT_FUNC_HID_IDX].id;
 
 	/* allocate instance-specific interface IDs, and patch descriptors */
@@ -1585,10 +1587,18 @@ static void hidg_free(struct usb_function *f)
 static void hidg_unbind(struct usb_configuration *c, struct usb_function *f)
 {
 	struct f_hidg *hidg = func_to_hidg(f);
+	unsigned long flags;
 
 	cdev_device_del(hidg->cdev, &hidg->dev);
 	destroy_workqueue(hidg->workqueue);
 	usb_free_all_descriptors(f);
+
+	spin_lock_irqsave(&hidg->get_report_spinlock, flags);
+	if (hidg->get_req && !hidg->get_req->length) {
+		usb_ep_free_request(f->config->cdev->gadget->ep0, hidg->get_req);
+		hidg->get_req = NULL;
+	}
+	spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
 }
 
 static struct usb_function *hidg_alloc(struct usb_function_instance *fi)
-- 
2.43.0

