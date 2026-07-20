Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45636396561;
	Mon, 20 Jul 2026 08:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535507; cv=none; b=FOmkKFbDxPzpTais5vHIkEPoZQ+paPCLfWSrLpBKhVfrrIyrjR+lj8RQB3JNcaOWdNkSTE3hLq9JHHyCaoCVb/c9ipZ8kfJ1ThparmZrxyBl2E/fyVnUr4ZZNJv91UxH4BS6kVuxB9N8mpnCUQ4bQBu4I1MKjz/tO7xfpa76mAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535507; c=relaxed/simple;
	bh=p1wwbP5bwV3lDoRslyupb8RtdrRw71t4vI/wJBVdGb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LJLTdmSxFByKGdXplx7UQ69QKac/EhYp9Wfce1UDudmDny35c86oc3WpdInImBOzVKk3WNa6LF+WDo4OWmJ3QX0U06pCh1vT6Ds+aPfFsHveL7SCajXsk5UzV56hIcn670GAJziqn5VpMqDHaj2c8/GOw+ui4hvsfQOe16ZvBs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=oQ566gWt; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="oQ566gWt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id:To; bh=JHgAjjXPDLM5eHmdZJZ6d3x8pQYxUthF9UqqtcaQEOs=;
	b=oQ566gWtvgE6IOZjQqpXQnyOLSwXFrs5+gMMUrGFcF5t5EI8fy6r/UDxFnZkEz
	8D8qDaW1iSQuYP2CX+o1zqtAnSDNg2CPofxy3S54gfGVIgcZEItQTsHbgEdJ8XNS
	cujysBGikEgsJWlFYfJl/B4yDsGijaWgx5yGF4dJw52C4=
Received: from [127.0.1.1] (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wA3PReg2V1qcZ5iKg--.42916S5;
	Mon, 20 Jul 2026 16:17:42 +0800 (CST)
From: Hongyang Zhao <hongyang.zhao@163.com>
Date: Mon, 20 Jul 2026 16:17:13 +0800
Subject: [PATCH 3/3] MAINTAINERS: Add HUSB320 Type-C controller entry
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-husb320-v1-3-4a1e259d7dc8@163.com>
References: <20260720-husb320-v1-0-4a1e259d7dc8@163.com>
In-Reply-To: <20260720-husb320-v1-0-4a1e259d7dc8@163.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Roger Shimizu <rosh@debian.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@163.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784535459; l=769;
 i=hongyang.zhao@163.com; s=20260127; h=from:subject:message-id;
 bh=p1wwbP5bwV3lDoRslyupb8RtdrRw71t4vI/wJBVdGb4=;
 b=3eRz+Z4YSRryMtE9LSX1d+8ZJSIpqYRPGGweGllVOMxc29thpR0XGJvE0qaGOvYsOQC/X1STD
 7JTIFLpJ4T4AtWSoW9bi1v3L/wk4h2wHZA1ABUYR4ercABeD2Bta7/T
X-Developer-Key: i=hongyang.zhao@163.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-CM-TRANSID:_____wA3PReg2V1qcZ5iKg--.42916S5
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFyDWw4Utr48AFy7trykAFb_yoW3CrX_u3
	W8GFy8XF4rCF4fJ3yrAr9Iy34Yyw4ftF4xX3ZFqwsrArWDt3sYyr1ktasakwn5Wr4fuFWD
	XasxJFWvgr17ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbD73JUUUUU==
X-CM-SenderInfo: 5krqw5hdqjh6xkdrqiywtou0bp/xtbC8QeRbmpd2afBSAAA3J

Add myself as maintainer for the Hynetek HUSB320 binding and driver.

Signed-off-by: Hongyang Zhao <hongyang.zhao@163.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 806bd2d80d15..d3390b1daa1a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12056,6 +12056,13 @@ L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	arch/x86/kernel/cpu/hygon.c
 
+HYNETEK HUSB320 TYPE-C DRIVER
+M:	Hongyang Zhao <hongyang.zhao@163.com>
+L:	linux-usb@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/usb/hynetek,husb320.yaml
+F:	drivers/usb/typec/husb320.c
+
 HYNIX HI556 SENSOR DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org

-- 
2.43.0

