Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C6A4BEE36
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 01:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435236; cv=none; b=qqGl8lHfpfEIXbTtP+V5fQ+ZuwZR8ByKMiKl6JSJNUVnkXRT9defRXnjcENsyM0VbQ+ydD/Eh5ohLp3qIJsW7BM40TGo04yR+9JGVxgzRqKv1gQGodhdvrEZHSnXfNCg7p3oEME/rhGURdVDRqZk7vteeEqaZfGDM3PsMlwt22U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435236; c=relaxed/simple;
	bh=cSt7jQUGq64ZD/zrBvItYaOU0WRDoEfcG5mlUjJSbrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KWE91WFxRLuGuQSz8G7QhXKTOczhmpmS1aEN+xsEYVSKe9NTkBVw3G3CN2MbUGB+iKZhhcOczYWtmRgEq9FcrVbHQtM/yD2XfoMEmov2OoElk5CHXHfdpkreCaE6DGA8CjV0fnXRWz06Y8SY9phrJGEVVf8vEE8Od/7yzJbjLHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9xycnDi; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9xycnDi"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-90cd4631090so4673796d6.1
        for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 18:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435232; x=1790040032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OmgxL+YzDrrZHo0jFAYUF9npAPr+/wsk6K1vfZ01BB4=;
        b=i9xycnDiRp/WQJsCAXpcVklYYWg2L5AIK+AsS2yNczylEHawYr2OWQj8zqz4BP5fu1
         DxXgxhwQOaa9b858i0xJx03rQmsobIVv2K7n6gH9mjAWUl6gTZ56oWFBv0M4b8BwOO8I
         CQSHT3hKZ9fvJkDWx3VOUKHP35EAeRobOfgRwVFhFiJwd22o6eBvbQbB/Eg2Q9LdBvgj
         oKU4P9dZZHm1IBIV2qS7d6/TJNCyvRkXbIL4gbJ8lc8MNskC/FqtXeZcIu3wGlncwxds
         lRH1pCOrhy50djvSN9F/Ndvsr/YrfCOImlyBsLBo4pgr196vkaIr1uzvzxQRxxbUokJm
         ZqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435232; x=1790040032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OmgxL+YzDrrZHo0jFAYUF9npAPr+/wsk6K1vfZ01BB4=;
        b=l0oZQFm68ED4yVoV1a1rCW+4gHrTVoEW4Eb5gKIZgpXQw9odK0yVNu+hotOwsR2J25
         X1r8PFtknqiX77qQu8eu0xCTlsW9kt5kDuxbaYFY3tFB4CDdbmg9GMOxPldcjYazABhZ
         qJQN6Y5a86rpsnPVo/Zb+eyR34YBnkO2NfeXdwdA61qjhoQWvCNbdQNuHNYSJwq2VMdZ
         me0QmhG1K7rWOXCSCpYHETOIptDi2srp/GQR+gmogEC8GPxSA2TD/sGTUN54YkTK3s78
         M6QNrMlDOMHkdU9ibPQ1v0xN5CNPFG6bLmsVjUEDKicTvD1GU61X3gaaNoN39G77cLGP
         f6IQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpzQ6oR9a/08aztOoqWMu7Ov0+XV6TLs4dbBpMH4oz2Ag7OasObLx5Y+7HVxz6WI0JNlFDQhHv4NY=@vger.kernel.org
X-Gm-Message-State: AFuF++l0ckX1gAmS/fqJ+ScWtKa+LJx5TkGNoTfBvCiHSozTyLhXhRBL
	cYJFOOfiZwdRaEtnDZk+9gQa+lDbAjziBuq3e41GZp07av5bZ3FEhLM=
X-Gm-Gg: AYBFou0EgPbgcGVdILniFreGZ1Ojsj+Nn8mCCowH6i4qCbVnbNg4KMYw5XVHRuQi7Ih
	cBnGmM70nbsU1lJJbxilBwSrSUnKpC482UGM8vVhlHrLjeEPJPqQp1egGrQqb/nj3AfcnxOczH/
	JeNtDz9uvcixjjheD74HQMg+pB6hr0Zq975f+xSUf0hL2ZHj6dGyujnEQ0ruPhbdD4kgMRl3IXl
	OX41IRP6HaMDO4u3fVqYCHIm7u1R+zI7UdOEWDMCv4B3LNrWxaOqoRjsuVmoDMkA0U5F/OUrhuu
	6cJr2gYa8BLdl1gHmTqb+1kGx3BjkGD9CcMS3JCsz+8CA33DWXxjqxwitPxz9tfAu2wim7Rr0uw
	tOGgxLIH5olQYu8zj1S7rbLRFz+5G+gFRM/DSZuPbZYyND0VV85V/DM4ofRoyDmYV58H4/Ggd7Z
	DZuvsWBZDd0vOqdG/Kk2/+jZPtRaSAiuB4hqJ7LOhoy1mKr9n/Kvrx3uWWTb2S0M+WVvp4dkBgg
	vfwK1rBNdIhXrbu1WagD7UWkY6Ua+3kJ30fGLes0yJ5Tf0mbH3gkykBhq10gQV3buroQ5+VQkTQ
	kOTxaRjsW9dgU3+oDITxEbLxl3VRrnI8oy20bULao7++nwJ+NuN3/gkntyp6YQM9CxK6kA==
X-Received: by 2002:a05:6214:4383:b0:910:42f3:958e with SMTP id 6a1803df08f44-9123441de5dmr26302696d6.27.1789435232163;
        Mon, 14 Sep 2026 18:20:32 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9121a62b783sm91141946d6.23.2026.09.14.18.20.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:20:30 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 4/4] usb: ohci-st: disable controller wakeup on removal
Date: Mon, 14 Sep 2026 21:20:11 -0400
Message-ID: <20260915012011.61874-5-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260915012011.61874-1-mhun512@gmail.com>
References: <20260915012011.61874-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Probe enables controller wakeup after the OHCI core marks controllers with
RemoteWakeupConnected as wakeup-capable. Removal does not undo this, so the
wakeup source can remain attached after driver unbind.

Disable controller wakeup after removing the HCD.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: d115837259ad ("usb: host: ohci-st: Add OHCI driver support for ST STB devices")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/host/ohci-st.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/ohci-st.c b/drivers/usb/host/ohci-st.c
--- a/drivers/usb/host/ohci-st.c
+++ b/drivers/usb/host/ohci-st.c
@@ -235,6 +235,7 @@
 	int clk;
 
 	usb_remove_hcd(hcd);
+	device_wakeup_disable(hcd->self.controller);
 
 	if (pdata->power_off)
 		pdata->power_off(dev);
