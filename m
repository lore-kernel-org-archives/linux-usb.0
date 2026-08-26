Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935DA131E49;
	Wed, 26 Aug 2026 09:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735724; cv=none; b=bXWgRc7+zqq+nXbDGv4f+dYkStRuTVZIZbq3HkRoNNN+AoftR/RQnUMncAj+eizBL0TX2HDCpTldklD0a8Utk0cXxgQ1YwH+U6uDNBtujNqshVKOBcBqJx9g2b1coADFX7foDrRIXHD/AK+z9+MYiG0YiFvQn/tFHmQy7yie5Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735724; c=relaxed/simple;
	bh=iOXQcWNIZo6P+tul7elYCEFf5zl9arqEtLfggmG71fw=;
	h=Message-ID:From:Subject:Date:MIME-Version:Content-Type:To:Cc; b=WML4ZGJ+rxHPiLGE6ut0irI3iOkjuRMSMGEN5MBIsw/6LlbCirRANprKS2mCpD0soCkMQfw8qGsFLWFjVL1IyHEwjCLSuuaYxfYMlmGBhth6PbfMPfkoaXtFZEcrJijx5KZM1sHBab4mVMQlPBCkK82Mo3AP0+taT8jcgonmmgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=rcihs6Ur; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="rcihs6Ur"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1787735710;
	bh=2jB10bkIyvtNCes4qAVmNWM1wn8uyoqG9TXcPKzfZV8=;
	h=From:Subject:Date:To:Cc;
	b=rcihs6UrKZKcenICQz672SwrunVe8TUXOGBlbB+XMATorB198u3NCLFK8s0Iy40wo
	 btf4Vji10Vkhvf5jFIcEQCRhzdNGFa6Xeu4WbSkhhoqeST2fvzc1iRzTxkYHPMRBNc
	 eeCb9CuXkP5lXgc7I/rBrXW9nncBDBdHsGar2oek=
Received: from [127.0.1.1] ([2001:da8:283:e049::9:8de6])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 3C73C662; Wed, 26 Aug 2026 17:15:07 +0800
X-QQ-mid: xmsmtpt1787735707tqq2gh300
Message-ID: <tencent_839D68D1416C291E9CB8C91F11C826B03907@qq.com>
X-QQ-XMAILINFO: Nm45YswcjhU8bQCgp1hnIzfl0/8DhDcmRd+qgAULcfibYXvpmV7N987HAkzu/8
	 MgxGb22M7MRmg4Wp11LBmAC1FML4HYtVpwJeXnW/8LsA7EI27cUldij3y97aysBvVExQyVTGnrU4
	 vmRxgl+B7YVEhHRBYrWh0j/x2GDEFDAOLZFNh8IEAbBUrsVf+AT3NumJp6+UcMnNm722o3WcHPTv
	 Jis6LMGW1QFlaOYi6AyDPCBrl9d8x6BMfOF5uvVkRni79Hrx/0u0s45+t/B0wRy5bzROD4n1KDsu
	 KMovGdLRLTz0KJOy0WQYpmg7I90dEeJzdeXeXvzaXEmEuZaSlXR/fhwAnemaIg0irJjovpuuClpQ
	 KXjqeYQQGuG16WnOmfw/GW8eR8oQlR2/ckVuczAOyBou24RU4VTrY23pW2gJakeLUvPfotI/sJYJ
	 k3CVHUwBqpSYm0hk7x/haetJeLb0RnEL9nd0Ng5WAvWSiwb0QW3B3GIJ43V3RHHLaG6GNkfm4Vnb
	 XgJTKxNRMjJtLWSokURZHoj40McjEFQJm1o47aY3pI15skFewofAQal0aHrVaek7ArI5+jMvMqp3
	 QPuSiVpkYsgXNNpJVA0jJIJizmBKmrtIeej3Z+tPYDMLjv5IJsVL5vuDuvGEwplwv7LE5mG1tgot
	 2mrtuH+swFSZ/sJUGmFXs1ycMHDdd3Sb69+luANoDgZqJARh+QZcuz132WOaUWfQhS+5mg4hvEAD
	 /jTwdIbqQsODF0DMAiF+fRSeE9kNkbXNrE9UM9jh8/FP1ZGYuKO2oDwlMzRHi/w8bDfTuZIwx6jm
	 iVTbBLbtS+35NVHOuk9DcOL4gcHnDPNEf0O8dvhujZ/3V216SeNsXnDMW30MUm7xlh82PFbG5SPQ
	 lZ6Jq35xuYfaOHOdlWpT63j2hWBW9AZFZf/9IIzjPXE3DOI/jIcuEYH/tvLyZa7dcVBg9dgy2/3x
	 f0O87Lfvn1r2aauaVvYO5yS8M2U1v2T+hMb/9jKCe2kgu/ZMQVxW6Yl16w53ZHcH7fGIJY3HaC6B
	 z260rSxEpdhWF7gGDTwQNkwgOO5Azd7b0TeOrKMtV+yKSvamqb4YKTuvvAtl1bWrb4QRhdj101sK
	 rf7JrVBgk/5/ge7hFC3RbeUIISx7yKJeTrz5Ytc5Luc1nG3/gl4/dYm01OQ0cgm5bNr6swXZ8oht
	 bGFlWMMgNLub58P9o0UrJaFiZ1HkXsjAOVmR3Rl4/cxQVKlw==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Cheng Lingfei <chenglingfei@foxmail.com>
Subject: [PATCH v3 0/2] usb: gadget: goku_udc: fix probe failure cleanup
Date: Wed, 26 Aug 2026 17:15:05 +0800
X-OQ-MSGID: <20260826-b4-fix-usb-v3-0-b28366e817f3@foxmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNzQ7CIBAGX6XhLIbf2nryPYwHoIvFaDHQkpqm7
 y7Uk4keJ/vN7IIiBAcRHasFBUguOj9k4LsKmV4NV8Cuy4wYYTVpWI21wNbNeIoaG6qEJZLIrjE
 oC88A+bTFzpcPx0nfwIylUBa9i6MPr+1bomX3M5wopliRlmipueTCnKyfH8rd98Y/UEkn9l9mW
 QbeWi64AjjQb3ld1zdZ78li9QAAAA==
X-Change-ID: 20260826-b4-fix-usb-c1a4f0505d8c
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alan Stern <stern@rowland.harvard.edu>, Felipe Balbi <balbi@kernel.org>, 
 Peter Chen <peter.chen@nxp.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Cheng Lingfei <chenglingfei@foxmail.com>, 
 syzbot+06ec7624018233e17113@syzkaller.appspotmail.com
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787735707; l=1620;
 i=chenglingfei@foxmail.com; s=20260824; h=from:subject:message-id;
 bh=iOXQcWNIZo6P+tul7elYCEFf5zl9arqEtLfggmG71fw=;
 b=tN01LQI5rMJWUirObgJMzg8iwZqcEBnf95y4H9j/KI0vWfDzkOyRMi//K8DInuNMz3So2FXNo
 jBU+2Jd2diADTto6Qmox6a9vdwQSg8XTvN+aBwi8tDClX37uRhcUlJN
X-Developer-Key: i=chenglingfei@foxmail.com; a=ed25519;
 pk=jJFtzwUiUOhTRJNlFx9WjsWHIYGk49Br17a7AD8MH2I=

Move the legacy goku_udc diagnostic file from procfs to a per-device
debugfs entry, then fix the gadget device lifetime when probe fails before
UDC registration. Keeping the interface migration separate from the error
cleanup makes both changes independently reviewable.

The failure was reproduced by syzbot by binding goku_udc to synthetic PCI
devices through new_id. No real TC86C001 hardware was available for testing.

Signed-off-by: Cheng Lingfei <chenglingfei@foxmail.com>
---
Changes in v3:
- Split the debugfs migration and probe cleanup into separate patches.
- Link to v2: https://patch.msgid.link/20260826-b4-fix-usb-v2-1-e39f343aee71@foxmail.com

Changes in v2:
- Replace legacy procfs with per-device debugfs entries.
- Add Assisted-by: tag as requested.
- Link to v1: https://patch.msgid.link/20260826-b4-fix-usb-v1-1-a090b5b3534c@foxmail.com

To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Felipe Balbi <balbi@kernel.org>
To: Peter Chen <peter.chen@nxp.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Cheng Lingfei (2):
      usb: gadget: goku_udc: move debug output to debugfs
      usb: gadget: goku_udc: fix kobject warning on probe failure

 drivers/usb/gadget/udc/goku_udc.c | 75 ++++++++++++++++++++++++---------------
 drivers/usb/gadget/udc/goku_udc.h |  8 +++--
 2 files changed, 53 insertions(+), 30 deletions(-)
---
base-commit: 3aa1dcaa4f6f5ae08936491e08bd456f331f2d40
change-id: 20260826-b4-fix-usb-c1a4f0505d8c

Best regards,
--  
Cheng Lingfei <chenglingfei@foxmail.com>

