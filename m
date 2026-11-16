Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864414;
	b=CyUG9i4ye9gl2bAsMqO70rQv0YpeuITMaYMHY5ti6DsATDQ/IT4JowT+fjPN/H+m+d5b
	 j9wUxc+fxVDyMK6QKGc6bW5lhpTxfDToFvf1nW3amwqFZMG3TWcD3TPYyL5KT0Y17nqhB
	 4/OYM115I00Cg+JmIT3ewcc7dPN8rjKfwcK88UbHeuSaP6bUIR+Yd3IVwR+UfH9/L/UYX
	 ZlHGaid5rVoKVT+fwMoUVs7zk4W5SwEDEYWX3xfA98kiUrQmBbEtnyy1B69GDl/fhT8bq
	 ekr8oF9xMGKvNRDjACsLDkkZOZDu5ZUNi9UsWlf6bBX5m3Rozpg4Y2snk5SoVmxWv1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
	b=EXxner5h8Q8v02uc0WrCkbFYqyoaTKtSm7KnK0csY2tqJNc460R+L2bhu2HUnJZ8fuM0
	 pQl9JiudCxrey9FfjLJxDsTBlR9j25R388fXp8YR4dBOhkTmJvbh3T0LVXr3iLa4Co+Yl
	 /h9e30PT2P+QKTDcRwC4bRPlsPkQ9mKYg+NNZUaZeHfapR0adsNDYM8l9Nx2bOsRON9us
	 42mU7Qo4Vlii+klNvtmkw5q+Oxw3PFKSu5m3gsGxpHIgnrqnySkgjSDSv9zhcJkVa2H+I
	 vTmPDpaqsTvPUfZ5/mUMrp2XAknM00jL5ys1m2Fw03YCFt7sJjOmLS19YSnHWENieNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MAURpxwo;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C3B606A31C
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 21:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4C3B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MAURpxwo
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso45093875e9.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 13:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864412; x=1795469212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
        b=MAURpxwoicsksSVnc2WAsPB6JHUpT01pe/omkWv1cyD9LfvrkdfTpz9XI4PTsY+lD4
         SGrVtbMkILUcB8UlVxbff+5OGS2lWyRPg4+99wfZZJ3kK751LFxY/m8LTjr6oiMVus8k
         NLNpqxitTryKXQIbIcsKSMHDOxKylCzOFabOSB6t/1IlelEkuKnAU8DjjPvXU/qZDKLp
         LUS0foLTPneGc0r/9RGpT435PfWh/Tw1+g5u3NiaPw6KH3UroKGAVTBs+bDKLGIwpZ8n
         3wkffWoIIDLNuNqC9dnlPrAPuX1jUL9NxQr36U7VkPrRC2O736zzBd6z1/JXDHPc7i5T
         PENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864412; x=1795469212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
        b=VZL7sMu+kHeq5f8c7Ilw8isnAubXiUhBpmGdVbHhdbQzkkmBm/lAHR4WTmdiInCdlE
         0kCVX7XmMMZvtpCFY+gzxk2/6IZtwr+aymfbl+Ik/5gn9HOqOtsglVYRcbEDT552vOsp
         6xE7we1K+E4ofPA8uV+RlggvtJzviF+39BXRoyr5xvhoRNtYs/TpP/jnDKAXyuM/e6BC
         N+7VZdMER04WLj8dREQooWNgOVm5Ag343AomVqlG/0tJF/YHe7u2VGu/MbvA1JObPSe4
         6hzeWt0lLwts5o+iL2JJnBXiyrr5sTbY+d1KtF4lBGRPi6hvjS6DP2qj6aNsJ0gWHm8Z
         umtw==
X-Forwarded-Encrypted: i=1; AL+hErGY5NWHhxiVnYxYQDIdzme9ku7elI6f/WGxYLfyRGpcdrs2pbszyBGHNEagQURiqnmSElkqGCU4eK8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pRS95Ij3438rIMBEQk4BdJnGr2NOqJDiJT6uIUU02897SWWLW
	+GvDYVbKVXRKROiRFtkFUBivbMa9ZsSelIZ1vViZS66Lk0NDqZb+Oc0i
X-Gm-Gg: AYBFou31u+ClWYHKaoKXj4mwxIDiytORwDhfC+8cGdVfnRI4qZJ74iWdAkcBALf6YTU
	/fEa96UP1rgXZAu4r/WbBTAFVoR5DJyt2Ny850ZPN5JQAjZSFVg44sJhgOVl3ltWNmc1UbcPkI5
	D68vC7+bdZrP8GQmdC7AFh/iyCtNiZVwbJ3cHX9kfw7E8YOqFxeO4/wcGCPs9FRh8QDS1BJeVA8
	GIIjmnzGlCNFkQAS54zIOgzRjFqIeet5Z+Z1wziRJHzSc2wpdHcrlfzNWQFfZYaYsbzqimDg06l
	OUl8pgBnVA8vSBzYuiVr55cfT45OS+oJW64BPCaZ+1eUsjGNwjq28fheGpq1smFs9l5+81NrnQN
	TA0Y6MbD7Xq0FNun5ca4fQSVcX1g8Ec2lAqmPxLuoDqqcA/rZ7myPEysSEgSfM0eWmg49DXC/wt
	MeHhHArRmp/AXSrN2ZmdUDE2VvWqeRFE90D1KcoePLCmBeZzRhnYaXsK+d8QVEci3APAnmtZzxC
	g+NIIsAo6G8F93rEvxLr4oxtoHUE9FgsL10nLfk/LJokNRH0WJ8wnH/bgYlP8S5Rgw4N1EfX4GL
	Yut+QEuWiAU5usJNgQftd2Ql9leNmnWKPe5n+MTo
X-Received: by 2002:a05:600c:3d92:b0:4ba:e7:ef3d with SMTP id 5b1f17b1804b1-4bb559f7044mr243891145e9.1.1794864412296;
        Mon, 16 Nov 2026 13:26:52 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:26:51 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:19 +0000
Subject: [PATCH v2 03/16] dt-bindings: mfd: qcom,tcsr: Add Halliday TCSR
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-halliday-dts-v2-3-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
In-Reply-To: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=720;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=sz0jgm6yJ2qfmdfMMgsqR7Wg9ExS4UZymLewfvVCvH0=;
 b=FqcgSljUbrxAce/Wb8/tWQg7D8BxyY05VfRoM3lIlKWOtWcZxkvJ+EYJdvTvvxol8FPPRApKu
 mw5+dUw4O8RDXBA5aD2L3Fg9fYj7OF5FtJNOsGNYBuFx4Z8h2/2ns31
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the TCSR block on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index a021e4dea486..e8a681b5e6ad 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,halliday-tcsr
           - qcom,hawi-tcsr
           - qcom,maili-tcsr
           - qcom,msm8976-tcsr

-- 
2.55.0

