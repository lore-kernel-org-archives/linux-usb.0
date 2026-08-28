Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1569D394EB0
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 08:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787905589; cv=none; b=KYXS8b/zQTYRU+zEyfT47xOtoxt+TrUhiChxO0ncOFsIqFe2M1B1KIh5YEhIl5/UV41V+rJ226jZsbU32K0W7AvX0U66DDs2pfQJc/rqi3JFjoF+21kGE0HscvmZrNyv6QqKLOMPfSc2SReaw4ZhDITK6n0WkIx2TumMKXfql0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787905589; c=relaxed/simple;
	bh=Dp2FIBzdSdlvjZerTkQhVLrz+YG0BmWaL81MkdAi3eo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b2JszaxVRDfH6a1kgN4LwSYuxyvS39WdXMI/Xn5kC3cTkzxN0ZK1HqHlXv+/dc5hGZlSqXVfY75nFvBYTB58GpTgaexoxO1BMkvZ9tAaK7D7EfJymseUsHOKSy5XwA7XkBufy2nO0PblXz63y+ClykhrCYeqaekjGn99tOp17n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DXTOkhPp; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DXTOkhPp"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-381b831d535so1465713a91.0
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 01:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787905587; x=1788510387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZS5I+zenDbcUpKg3uFcY9xherRojUVbxgDFlqv6/s5E=;
        b=DXTOkhPpAmwRQfq3YV4HxOi9xnvs68rEY34MC7sbgk/kdqgXjasu1Joyw1OC57h1E8
         mLSY6JmDCRhFbPP7cev36dH4RVD8nLihkjiflhDxIIc8ARIt4T8HylhTQO9VudcCH8yK
         ULtUUVVAwoBVwdXzEDELLR4/mkZECwYVf5DI2dxtVm3GCtJ1DEYVh+Q64ssAFc/dgQDx
         RUv2dXVt1FL+xjCiRnT4jx0mCeZJ/UtoUXGPnyX4IpR+zBSkhi+eKTyg+A/wjEkqtyaT
         RifxjmR/qwmf800A+RcCoP7rDmSewjhe4Dx8BQ/s0dTEFufSjO8SqJOM77LAq+aTcayE
         rv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787905587; x=1788510387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZS5I+zenDbcUpKg3uFcY9xherRojUVbxgDFlqv6/s5E=;
        b=KsYIhdqhz8tQH6n5lhmT2QEo3Ya9Cdk3W67SeyhFgx9D9J4hatQd3WTCwTQZTR1RNp
         1bwC+LjcT33686grv+4C91LFpXmHd3MwDyqxY9Hl/iy4SRM8shbI4bzR4jZ+bmjhOtok
         ELO7mxIS6PsW2ojuj6+7KWt54FczaS6efYdjqu9L7LBT8qdf4kNn0gE7aerq0zh6L4DT
         arMZ7tzt7HE5BY100hvl17tnjR5lB/lZCm4zzFKpRB5wk6n+vyMpwjUojhsGD48jMRqP
         IfD1BLxSt+VqvBDoRJW52a8mZdyfMGgnbD1iUWk6cztYvQlF7wcHAZf+ssybIET/s0G9
         MnMQ==
X-Forwarded-Encrypted: i=1; AHgh+RpJUmOYYn+X49Dy7RBZNHZSZqZchCl/GOZGliladc6kdbnI8laze0IdxLiQTvCl3ZZoVcNpcUGPCZ4=@vger.kernel.org
X-Gm-Message-State: AFuF++kaR8jZgd9IY84GlYshZFHn1qrwCI49N94G+ecdUa8/IsmRJqUS
	dSocPUbljLyN2zTV9ZOCxWNyp0kaaqdXANmojxWzJbYCj7WmZzhvCKyn
X-Gm-Gg: AR+sD12zeEL+QUZx9uRPHZm7eZR3pSLrBOCHGLPn6A6PoOr+BL7qnigE30Vl7Vx1N70
	FroVzv5A8hogSQUWYslJiywhIujDHvGhTuJ6BV0+NWuzTmhP66lvI8m0K1K5cedzGvJr5CVg5/k
	zy5B5sKydBEOExW/snQwavh5uUyan8hNKblz/qacSFWcJ5FSVs3oXxSk4V2cGYPux/YpnGjlKA4
	LH9c3mhvLN17XNabb95EJEz73AM+baKw37a31nbGAm45ddg/tvFR6k5BsNf1A01LIplE3nY89jR
	TWuHmxqMJa+YhfCe0VV7iliJQzpxCxzZYfJN8IqfRU1HTNm+Wp/jwJEcbjSl9+SALY37d1QwgUk
	SNP3xE6pHo1Nj0a76UWojLiJW6o8cSiTzfvvyp3bqf/dNJS2Qw8n5P4+mzCLov6I4c6gOZsRcpv
	IXNb4sIr1KzTyAzZ+HJ/+vd0SXMaivJzLEegG2zFe28XQ/GPrWPT0vB8y5QTjzw9L84wfe8pefV
	OiyzgVC9CWoopyHsisDj6QN4ceINcZorzb+ZIp3h8Ki1wzmapkiFbROOmX0R9sDs7ugSo4=
X-Received: by 2002:a17:90b:2f0f:b0:380:fead:448d with SMTP id 98e67ed59e1d1-396d0fd2a75mr10829499a91.13.1787905587371;
        Fri, 28 Aug 2026 01:26:27 -0700 (PDT)
Received: from ian-lin-DREAMBOOK-PRO-14V.. (59-124-157-10.hinet-ip.hinet.net. [59.124.157.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396ddc07777sm1772399a91.12.2026.08.28.01.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:26:26 -0700 (PDT)
From: Ian Lin <jisayme@gmail.com>
To: bjorn@mork.no
Cc: johan@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ian Lin <jisayme@gmail.com>
Subject: [PATCH v2] net: usb: qmi_wwan: add Compal EXM-G1x support
Date: Fri, 28 Aug 2026 16:23:09 +0800
Message-ID: <20260828082309.12513-1-jisayme@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828075644.6228-1-jisayme@gmail.com>
References: <20260828075644.6228-1-jisayme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Compal EXM-G1x is a Qualcomm SDX12-based LTE modem. Add support for
its QMI WWAN interface 8 using the DTR quirk.

Tested on a Compal EXM-G1x modem.

Signed-off-by: Ian Lin <jisayme@gmail.com>
---
Changes in v2:
- Split the QMI WWAN change into a standalone patch.
- Document the Qualcomm SDX12 chipset.
- Improve VID/PID ordering and add a product-name comment.

 drivers/net/usb/qmi_wwan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
index 8178a8758..fdfdcf24d 100644
--- a/drivers/net/usb/qmi_wwan.c
+++ b/drivers/net/usb/qmi_wwan.c
@@ -1446,6 +1446,7 @@ static const struct usb_device_id products[] = {
 	{QMI_QUIRK_SET_DTR(0x2c7c, 0x0316, 3)},	/* Quectel RG255C */
 	{QMI_QUIRK_SET_DTR(0x2cb7, 0x0104, 4)},	/* Fibocom NL678 series */
 	{QMI_QUIRK_SET_DTR(0x2cb7, 0x0112, 0)},	/* Fibocom FG132 */
+	{QMI_QUIRK_SET_DTR(0x04b7, 0x8217, 8)},	/* Compal EXM-G1x */
 	{QMI_FIXED_INTF(0x0489, 0xe0b4, 0)},	/* Foxconn T77W968 LTE */
 	{QMI_FIXED_INTF(0x0489, 0xe0b5, 0)},	/* Foxconn T77W968 LTE with eSIM support*/
 	{QMI_FIXED_INTF(0x2692, 0x9025, 4)},    /* Cellient MPL200 (rebranded Qualcomm 05c6:9025) */
-- 
2.43.0
