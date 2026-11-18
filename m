Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011237;
	b=0ybsw3ijhz7OINVJUNCIHB5ck7IpTlkB5kforywreGBkQDjEzJPZtKPHZc5xYYrb/z9n
	 5Ttbi7E6ZDJCxypFj7lrXq/UsXSs/9+gaVWgFxJ4yqYdx20/w49NMCElBi9EWq0aDWSDF
	 ef0WKKJWe6F7UJMLN6D3yko2faK5HMlIWKO3KhDV+tO26fJybCu0sdyKaLxvpacGjpRfA
	 0KDMdfAHsXJHLslZc9Ghn2TSBnch5OHVUAdOq9/xZ5rViU2TNJjkbUx9VH8iqCuU1odmi
	 AVctz+VjknosjWjEBiDC5+f48ouuRx7OkRyWbLMvAGA+FTYKRPwqHMYOoZMERsUarpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011237;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:X-HM-Spam-Status:
	 DKIM-Signature;
	bh=B1Nddc/qGpNwrjS9IUI4dl8xbOE1/6p/3UcD8cYz1MQ=;
	b=gLN63VK3DvkkE+CNKNgpF2vj8ZxfExKKIYi+g6G7AD8Ja/F54h4+Ori+hVi7tk2GYkar
	 oEToSV7WE27ZCxW8/QtG1po5g6y//v8rrrd10tkUhgg4vpS2FCo5mH3jfoIUdQIb3K8XN
	 smdAYGjhIeyiqKFSMrErsFIIZ7neBcWkNuEsCFGDJZtQKL8FJPEvnNv35cgsu9hXz6Uv9
	 3pixErg77SF+jNM6L2ss71vzdE4ez0o3iQDC1uXGkPtRi8aGtgtiGL7426b1eQWw9PCRr
	 Jlk1ENzyMDYsx5cy6XLJ3NsjMQVhJV7bUJt5/WwJGx+I18m4A/G9RX0cNEhs7GRcMhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=VXQmyBa5;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FD7606A339;
	Wed, 18 Nov 2026 14:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68FD7606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=VXQmyBa5
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5526d7856;
	Wed, 18 Nov 2026 22:13:48 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] usb: gadget: nokia: Fix potential use-after-free on bind failure
Date: Wed, 18 Nov 2026 22:13:47 +0800
Message-ID: <20261118-324f82bd41-usb-gadget-2@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118-324f82bd41-usb-gadget-0@mail.sdu.edu.cn>
References: <20261118-324f82bd41-usb-gadget-0@mail.sdu.edu.cn>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1ef01b41203a1kunmc2b9e01c1a0cb1
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDS0oYVksYSU9KSkJNSUJOQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=VXQmyBa5PnagJhd92DXUJT2yMP5JiCZxAG0wXuLb9BY2msdXMRjQdntpALcmXvWjHP/ctIjWN65JNS5gJFKMNRvERkq2GvbnUg63PYaig/UWQPLhCaKAPJ5yFe7afQGE4cszfabGF6ZpGmD+igV1qWUchWieQcsI9pkJEM1/gZ4=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=B1Nddc/qGpNwrjS9IUI4dl8xbOE1/6p/3UcD8cYz1MQ=;
	h=date:mime-version:subject:message-id:from;

If the second configuration fails to bind, nokia_bind() frees the
functions in the first configuration while they remain on its function
list. Composite cleanup then accesses the freed functions.

Remove those functions before putting them, and also put the mass-storage
function acquired for the first configuration.

This issue was found by our static analysis tool under development.

Fixes: 15761826eecd ("usb: gadget: nokia: use function framework for ACM")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/usb/gadget/legacy/nokia.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/gadget/legacy/nokia.c b/drivers/usb/gadget/legacy/nokia.c
index 396605a84cd1..87d496e9b2eb 100644
--- a/drivers/usb/gadget/legacy/nokia.c
+++ b/drivers/usb/gadget/legacy/nokia.c
@@ -267,6 +267,7 @@ static int nokia_bind_config(struct usb_configuration *c)
 static int nokia_bind(struct usb_composite_dev *cdev)
 {
 	struct usb_gadget	*gadget = cdev->gadget;
+	struct usb_function	*f, *tmp;
 	struct fsg_opts		*fsg_opts;
 	struct fsg_config	fsg_config;
 	int			status;
@@ -357,6 +358,9 @@ static int nokia_bind(struct usb_composite_dev *cdev)
 	return 0;
 
 err_put_cfg1:
+	list_for_each_entry_safe(f, tmp, &nokia_config_500ma_driver.functions, list)
+		usb_remove_function(&nokia_config_500ma_driver, f);
+	usb_put_function(f_msg_cfg1);
 	usb_put_function(f_acm_cfg1);
 	if (!IS_ERR_OR_NULL(f_obex1_cfg1))
 		usb_put_function(f_obex1_cfg1);
-- 
2.43.0

