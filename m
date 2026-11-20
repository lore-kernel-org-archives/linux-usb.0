Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208792;
	b=CGYlNDw1UtJn8k6icVce046vlUYC3YmsqvnsKAyPTvc+2CFGtCul6JT4dkPfdiTujjaK
	 e8qyAPViYC09bFpRZQruFKNdTH7Jm4zNAcK+Nu9fJO2+3xHZGfVjhcd3kd/sl44mdINly
	 g516yNMWqzELUJxETRmudpwkegJPC9b5zkJKAJCyYafwJy76Qy1SVpHLseFRe5P872y36
	 ph6WwfLs0odIOFNkkClXypukQ6641TvybAZr11OrsmB9IeHQ5+QerLClNIq3U2tDTm8Li
	 Htet0pxI9aqyC0631rF8s6vusen54maYQ7zg/qZdV85lEmUF6yBDWpPTKewE7KAl89Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=3LS5gvBAydA0Ig1FL/11e5L9aa77Zg2FmflSrEEofQc=;
	b=32NPTeHBXQQ5EXL5L3rWwaBT75Xj89AouJWYmAdmWgbpBTAPr+E9utcOtHlvKVoGMOQv
	 wnBfS3DZrwIbPYtQ1Tr9xoGfvCEE7x01srYLQaBzCdAnQk6P0lZEH2/8N5l6M83KyS5I3
	 2N2bQ+WGxvuXWqXqDcEYXYmwcUVJvVww8L2dCF/nRrpKEQqD4o2ny6dDUwshY4yfZBdms
	 q3rArP7S/oLyeZMDjPvRMdB6cS7ZJdoEir5hXEd5zrrCj7AG3fBKOhCKssIlx6p1HXmYS
	 aMe7HmfNVgD8Pb92Zr4B8p36eyM1M3gOiByWhHMK/dfSxin7kmdXYb4L8lU/CwJucNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yfmtltvj;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D572B606A6B2
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 21:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D572B606A6B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yfmtltvj
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-9212dac247aso15275666d6.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 13:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795208790; x=1795813590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3LS5gvBAydA0Ig1FL/11e5L9aa77Zg2FmflSrEEofQc=;
        b=YfmtltvjYin2V0r/X5r77eN74n1Qf5MVudBB9cLA7bRTyHQ1S6vpmEM62BGlRaXwtS
         xifBTkIhBJ76sN4Wer8ZTPZuKxVOMd8ClMyJBExXj0d7bRpEUZoIKPGY+PScsLrh9aku
         Nem1DVqLtR5LnicdQjbVLavtKu/oBXt1c/QJiE48IytIXDYjlw83oQzZjKDM2T9z97/8
         aqGwbkAq7vl6/1Rj9f4yoWxJ26fS7118ia/YDw5eL3vYO53181M4Y4Pphero1q/qqrRa
         yIbiL6dj7Cm3hefZ/5DuoSh8MnQXcl+0mvFbPxccv9y4LBbLK9dRU4ndJV5SmSDpCS9M
         hDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795208790; x=1795813590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LS5gvBAydA0Ig1FL/11e5L9aa77Zg2FmflSrEEofQc=;
        b=IA4ih70ZUXiBtC31zZ27AaEjSO2gzteo+iWH9QOJzycSbPUL1Tkv6wjhI977YuGWjO
         +CqftG9Cm17AU7Oq7WZ6wuslKe7RtWFhYhqcLIa/ZYFd97xCbHV0kvK2GbOvnaajLPN4
         TLMs7ZYCqBP9tYbyv9RgtXuY/nTs4UUJUAAcJsb2P+n7bYvhyd5V+YG11IXXp//8Psoz
         1ba4kaywQBYiVbyq5hDyB3J/RoZvfnWOrVqsXh2vGQIezO3pgqEwHdkc8FUhrkB4MCQT
         0M0Y3QXS4tTxAkbzIgor6CrlgHSkqlkuGvI9AYcLMz1Zcb5Q0W62YgoEYsCVet1XgzFw
         5Nqw==
X-Gm-Message-State: APuU4Z8NZExOezGZO2L/gymtWi89Y0wIGAhaL2FYygLybSe5+9zPy/0W
	YyhZUKGYHMLDrXt1pPm7yuoQJ7vbbtWHNUvLZBZLYc2BgtbsfgEAk7mLRUm6O4yE
X-Gm-Gg: AZFdTZe9kkc4G9qdOFtb3TCuS4l7t2jjTLnQBuBiiSx7uHW6imCAYpIzzvmwJy+L3om
	Hu3qUroSVpcRwm/3EDhPrT0/WrFXn4UK1u6QZHFwCVpj+acz1oEKfiJjHwIzf3DT/Ropfcr5XJt
	v496pIeG5NCg4reLlT95+hiBhFJq1r+1WCa69ZqEjrNqacghKC8LHcHLQNxLimHTnr08bUb6upF
	5x9tEqNWXUHJv0VnU7rsFx7b3jugCAMv0Le9t/NHFzlmRq3792GBH1oWUqdIgi3mU5CKT8Sg84H
	JrsgvesbRwPQ5F/rO0h/bxSX4FGm3er6HuDuo38Wjpwjo4e9J+PN6/aBUoXaIJjtTDrO6L23S9O
	x78fegBGk0ogm6SwRYBCouRt4WbN+/EVHWhDuggfUrcBeGM6u2XWJUi5V3GVWux7sEHNxZvaKCG
	dSlh7X9lIU1en/Qpect/KuAvTArcHZsDi0JFbi4NWFYiSXicye7dvEAtRx9XAgrMHWleN4ql2iD
	h1yTSK/Axq5+vmBKU61nG98O5VDhGBOYLJytldKbtG9TNT4jwalL/s3aPsvhNJ5eRRJkhk6v774
	yJ9tUwlUFm2IsWsIvSWDxYKXgMoBn7A189mEFPwSvdfLz3+XvVpG2t7Ffc4=
X-Received: by 2002:a05:6214:84d3:b0:91f:1e1b:7b3a with SMTP id 6a1803df08f44-92134b0c780mr49391576d6.57.1795208789683;
        Fri, 20 Nov 2026 13:06:29 -0800 (PST)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134bf848dsm35509986d6.44.2026.11.20.13.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 13:06:29 -0800 (PST)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuangpeng Bai <shuangpeng.kernel@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: gadget: f_fs: fix use-after-free in ffs_func_unbind
Date: Fri, 20 Nov 2026 16:06:16 -0500
Message-ID: <20261120210616.2293426-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ffs_func_unbind() calls functionfs_unbind(), which drops the reference
to ffs taken in functionfs_bind(). It then keeps using ffs: it takes
ffs->eps_lock to free the endpoint requests.

The superblock holds a separate reference, dropped when FunctionFS is
unmounted. If the gadget is unbound (for example by writing an empty
string to the configfs UDC attribute) while FunctionFS is being
unmounted, ffs_fs_kill_sb() can see FFS_FL_BOUND already cleared, skip
unregister_gadget_item(), and drop its reference. Whichever put comes
last frees ffs, and if that happens before ffs_func_unbind() is done,
the eps_lock access is a use-after-free. KASAN reports it as a
slab-use-after-free in _raw_spin_lock_irqsave() called from
ffs_func_unbind().

Before commit a3058a5d82e2 ("usb: gadget: f_fs: remove redundant
ffs_data_get()"), bind took two references and unbind dropped only one,
so ffs was never freed and the late access was harmless.

Do the endpoint cleanup first and call functionfs_unbind() last, so ffs
is not touched after the reference is dropped.

Fixes: a3058a5d82e2 ("usb: gadget: f_fs: remove redundant ffs_data_get()")
Cc: stable@vger.kernel.org
Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
---
v2: Don't take an extra reference. Instead, move functionfs_unbind() to
    the end of ffs_func_unbind(), so ffs is not used after the binding
    reference is dropped. (Greg)
v1: https://lore.kernel.org/all/20260815013818.39466-1-shuangpeng.kernel@gmail.com/

 drivers/usb/gadget/function/f_fs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index c64a268e98a4..fe4564d68b18 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -4212,8 +4212,6 @@ static void ffs_func_unbind(struct usb_configuration *c,
 	drain_workqueue(ffs->io_completion_wq);
 
 	ffs_event_add(ffs, FUNCTIONFS_UNBIND);
-	if (!--opts->refcnt)
-		functionfs_unbind(ffs);
 
 	/* cleanup after autoconfig */
 	spin_lock_irqsave(&func->ffs->eps_lock, flags);
@@ -4236,6 +4234,12 @@ static void ffs_func_unbind(struct usb_configuration *c,
 	func->function.ssp_descriptors = NULL;
 	func->interfaces_nums = NULL;
 
+	/*
+	 * This may drop the last reference to ffs, so it must be the
+	 * last thing that touches ffs.
+	 */
+	if (!--opts->refcnt)
+		functionfs_unbind(ffs);
 }
 
 static struct usb_function *ffs_alloc(struct usb_function_instance *fi)
-- 
2.43.0

