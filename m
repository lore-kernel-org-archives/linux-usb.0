Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC03C317173
	for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2026 19:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783019644; cv=none; b=R4jmUbW4g6Gf674mHadJamllWon+y1gY9XqZiRtbtEG4DxJLWjH7N8RghpJdZsuH2C13QBNXaRG1ekgqBHJuhzNCvBzKdKSxle3Ce1gp7dTAjwhK9G4oatNxGWb0MZRqsth/OvSJPTnav+VxNDiTUC0k1W8BKSDKXJukaIt+tHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783019644; c=relaxed/simple;
	bh=W8ivqy79EFzNA2Ezx20CfLZ6HP4m2lPjNmQN4QglcI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D7CG1j41wUFYo7HMiCVxQbopIPWluyu3f1JjLmFVaWIyBC09ye1yuK6GlauNvrVGJJfY/xfk4D8c8Vs2SRnszJZpKll2zuC0oQp4tPs6CxeKvKQgGjToLzV1iLjY9rRgnG4O+PhW20touqYwaTYprgA7pxqW9vm1BvQZjt6AdVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p0kOaBLi; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p0kOaBLi"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8ef7b7651ecso7215376d6.1
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2026 12:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783019642; x=1783624442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VgXZ8nPMmK/Y7f5cDka+f0jwbicN2i3iuL4UpZ5H8qM=;
        b=p0kOaBLi3DhG9nq938bKI89qYaXN4r4FRlRPQHUhvckIxrAxtvKcOWhw+257bweQyD
         eUzcdcQ/7+xfmzboBl5qZVoZFIBKqOcWmgsr97f/GZt6GMF4OrfOznKXdWUF2+qtrqMS
         sz+2MVOgtpFAp4rfMu2MJVvG24XckFxpyWC/WNqX8tF6Uok/+xMCZ1rwzF7WRzSo5tw/
         5ih62YDdsXNFvFjsEbC+rHfIAFXbZIy6Q6fSlqcLHoihG9jksDRqUC69kunSd4y1FYw9
         5xjEywqY1akcXGOf62zfl4a8wquCd/J0hlk6sIKjwh/BJkFu+YPsi0uItoii8zIC+lNZ
         rOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783019642; x=1783624442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgXZ8nPMmK/Y7f5cDka+f0jwbicN2i3iuL4UpZ5H8qM=;
        b=E8AECmqQB32kVFbu9g703eDdZ3sBZBwnBCBimFirYDSKrwsnLhnpM9cbCJ2w0JPM63
         03+yxzigfXPSN4VfZbmCB9gR+9m0sDQNUpZkRBloIkcaMoXrry5BSh69PPxc3gK3SVgD
         /7NVN5bdPz480xb3hS0P0rp5j07cS+xgGbo6kj2f+X+ywO3Bjga1cyhRJhmKowJ4r2s6
         kGxvnDxypVaImwrK75VXikhfxebtOEUBLVZjzkkLUSpHO0lej6W24/LV9DiRck2GkGcW
         FfjFK+MqSjFq8yHRbSkruHxf2Za9kfLVCdi+XR8cEAWVFxs2U3lnfN/D2KdEB7duGlE2
         GgbA==
X-Forwarded-Encrypted: i=1; AHgh+Rq0tdQRph43DapbfoiNwThynsa/6ZVPuZ3LNlt1VvPDL7eSVcmCuId40r5BHhpTooZf80NYUmf9tJc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg7gpUfLA3S1oRh61V1AqL1cOGdvKQ08Eq0mhpjhKml+1SrnkI
	ve0X2+osocBMfCb5+9Jb890vHZmdFPu6s+/EOePzrh3/XQhsCLtKpW7b
X-Gm-Gg: AfdE7cniWEl8KzbDMhf1L4PvsOx7XmULIjRcRmUXvDsjL3p6JKn5QOvCTYm9EvPdsUd
	tasLBRGXgNQuMAbqlhZ+BiTfDgM0PNuVCtjDrmgVoNsfKF95XnP8nM9snc2ery9yc4maaUH6MBN
	vRL5bLSd/39cxsxGm9S1eUt0yAdRhcV/uH4IOuHbe2NNy7dtUyhkfSt2eEWfGED5VSrXzKu2Jrj
	nI4kJUQVr/dn9wGIrP1V6lcmrBeDZSqB0dqM59iO9Mn7IEJq5qbPihmxTu74z3NvXrM5EaBiPAd
	45wK4Sy667710CMif7o/IW8bAbzBEzWewR8yJ/XEI25f4gqqYvvgZdrkG+3yhtnfTMhyWjG3yYk
	LaEik0hJkDX0hddgwnnladD50XgAAT3cOwdBwzzV/Y9200hwvozi7VglLrhE3b/0cSC/Zv7MjRq
	pRX49brL+pDDkxDqQb/H0PxlRpd7vrpKiYx5t/4bXm3VsBJd1Hn6vz
X-Received: by 2002:a05:6214:300f:b0:8f1:505c:1d2d with SMTP id 6a1803df08f44-8f5bce7c7camr16033426d6.14.1783019641478;
        Thu, 02 Jul 2026 12:14:01 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f4724bab9esm32580696d6.42.2026.07.02.12.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 12:14:01 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Subject: [PATCH] usb: typec: class: drop PD lookup reference
Date: Thu,  2 Jul 2026 15:13:29 -0400
Message-ID: <20260702191329.2648043-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_power_delivery_find() wraps class_find_device_by_name(). That helper
returns a device reference that must be released by the caller.

select_usb_power_delivery_store() only needs this reference while calling
the pd_set callback. Drop it once the callback returns. Otherwise the sysfs
write can pin the selected USB Power Delivery object and prevent it from
being released on unregister.

Fixes: a7cff92f0635 ("usb: typec: USB Power Delivery helpers for ports and partners")
Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
---
 drivers/usb/typec/class.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 0977581ad1b6..0595e8cb83aa 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1619,6 +1619,7 @@ static ssize_t select_usb_power_delivery_store(struct device *dev,
 		return -EINVAL;
 
 	ret = port->ops->pd_set(port, pd);
+	put_device(&pd->dev);
 	if (ret)
 		return ret;
 
-- 
2.43.0

