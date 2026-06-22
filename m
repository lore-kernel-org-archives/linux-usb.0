Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31452D8795;
	Mon, 22 Jun 2026 11:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782128752; cv=none; b=RwTmA7qJU62KhamS0d6FcUp4Rma/wEEow3gNqQ+sQBQPoLiFoYNkcGEch6bMxy+LMoj6TGGelmGoEYOKxAfKrFpAhFcOjojTHQGYWcSpQgbrnb+DNfZ8PAQtL4CZ2CKI6WPtSEQwpFuagq94owWAOzzjlOcY2ym7GZa42P7B8oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782128752; c=relaxed/simple;
	bh=F3iRwJDxw7ye2tSJKsK5RbhuIsIZejNawmVVD/+cj1k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I3zcW5eHkiBi8L9xIrseBFWB6wintmLNpPxiNVcoYhRQkD7y9+FjKRUttTz+PQuHvHOlbWkjXScdYM8ZxARiX//APFssswpcJH/HJFFJqshK+eN7lV887Ugw7D+Y0O1TMC8wezEqqIvXZTMG9LAyRVaMR2ASS8JrmfE42tzUleA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=BFHR91dc; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="BFHR91dc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Eb
	3vm2akT4dsF9Sg2fJHSO22TPwx9w1FB41o5LbTkg0=; b=BFHR91dcyMbUu3E/u7
	X0B/CF4XK9KA4oaLosCcuAqJJkfeMDmI/k/psfcAZ4nCV6u6XeOGsJLl+jkLAB/o
	f+sdCpA4IeuBcqbfBWhAZK5/O5pRPY4baCHJBnJwiQ4391CRInzgDJl3QGOi8XYk
	6mHWHDzgvwH4DneQ7shSWrTOc=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3R+FTIDlqunoJFA--.32847S2;
	Mon, 22 Jun 2026 19:45:24 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: gregkh@linuxfoundation.org,
	kees@kernel.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] usb: renesas_usbhs: Check pipe allocation in host pipe init
Date: Mon, 22 Jun 2026 19:45:21 +0800
Message-Id: <20260622114521.1022197-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3R+FTIDlqunoJFA--.32847S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF4UKF17Jw1xtFW8Ww1rJFb_yoWfArc_Cr
	1kXrn7JrWaywn7CF15tw43ArW29an5Xr1I9FsxKw43GFyqvrs7CwsxArs5Ja42kF1jy34k
	uw4qyr1kZr1xWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRtPfQDUUUUU==
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7hQGdGo5IFSPpQAA3F

usbhsh_pipe_init_for_host() allocates pipes with usbhs_dcp_malloc()
or usbhs_pipe_malloc(), both of which may return NULL. The returned
pointer is dereferenced unconditionally when clearing pipe->mod_private.

Check the returned pipe before using it to avoid a NULL pointer
dereference on pipe allocation/setup failure.

Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/usb/renesas_usbhs/mod_host.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/renesas_usbhs/mod_host.c b/drivers/usb/renesas_usbhs/mod_host.c
index f7ef3a9f82a4..11244cf3408d 100644
--- a/drivers/usb/renesas_usbhs/mod_host.c
+++ b/drivers/usb/renesas_usbhs/mod_host.c
@@ -1441,6 +1441,9 @@ static void usbhsh_pipe_init_for_host(struct usbhs_priv *priv)
 						 dir_in);
 		}
 
+		if (!pipe)
+			return;
+
 		pipe->mod_private = NULL;
 	}
 }
-- 
2.25.1

