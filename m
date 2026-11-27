Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795821307;
	b=vm2fGfnrPErxEM+mnVSkdTLDVwa5mCfL4xg5s8+7fmzIVh1VEzj5fzQUOUujwA2zHVEB
	 CW8iOhXwVDxOW0ftD5TvVtkmFx+Q+EadFlsmqcc6tK+NU65tZj6kxEF9YKJLKe6HpKLwF
	 1ZYx8QRbyO8j602i/+TiQNJD9okQ7LxAHcXYmsKh6Z0FsgP0qLx8Pt2dA6+bfAYBJgSL6
	 AwU5JTgflxGAMhEqROtwNS8wykV2awNOw6W+uDoTBggvnFNE8tw0x4M+jne1SbpfCHksm
	 4M3SS6DMJ2YuJIv5dvDkK3DEE5oM/Ssp9lUWR+MVfXgPb/GWjY1FgkWCXPYpsVRwiBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795821307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=U1M+MDeqlkODjZ50qKjXMO75f40J30DxxF3l7NYSGEM=;
	b=I9uNCdCrHWVlIkDb1uqptUngB9k4btPbBWU3pxwejARtcc4uKGPjvrKUuaig9U6kSAxE
	 M7HpUiiExBYssxVDruQekemBrW6gJGAuNZh8l4EtJuizmpZD0JViDO5FR5V7htfq3hMRO
	 3VbZO5j9vXS+RrV7ZyJvNceBQRJqp21NtC04uwahJQER08CHy1uUVnCYqDadXnH33LiAa
	 wXNZUBChl5g+bXMrFmktPd24xVFPeebfr9UakTALcDiExIz6RagAGdR13xNA16cikGTZa
	 YgYufV5JcGXNxaKJttHTRmLAYfcpkOoBPi4l7a4chtlWd+XTNKDERDNChuoPkYG7cIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WDrBk4z3;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C091606A33D
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 23:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C091606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WDrBk4z3
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso7591037f8f.2
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 15:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795821306; x=1796426106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1M+MDeqlkODjZ50qKjXMO75f40J30DxxF3l7NYSGEM=;
        b=WDrBk4z39jTSJg7fP1LZv5pSAmcolbmVo4wwWMjjlFQboYBu3wN5rJ9GYnYJV50K3+
         tkw+jwH1lJXR7gVV/OBT9/yk7tTAiZrdu2ajb+eYT+UVhWfUsEfp6iR0FSExSHMDzvsZ
         3fpjMgMby8qPK4rdWEnPxtHr3jKM0uthso6MfAww0lrr5k/+C3OtKtXfdvcLi7gHPltW
         qCeMSaWpCWUuLbQVELMCkcXgultuZ6nRhj58FRGzZaFMWHaLx3Tjc30C/hZ5vAlCSiMn
         7dF5c687gdpqCnnInSFJs2GpiUdsUfdCYGv9dUppGS+08fFr1MS5RebwLf1K2w2KKf8y
         FyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795821306; x=1796426106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U1M+MDeqlkODjZ50qKjXMO75f40J30DxxF3l7NYSGEM=;
        b=2SsmUGhSA2IjDIT/p596phc76jSZpRKpofrXVEspbB+A+rceKxKCG5Ebz7Sk7B8oy5
         OVN8NF9gc8lZUWbzwYM3mGNAfJFeEAo9r8P9QiNDOLdcl3j52TBfXOZtG4w8tN1EpUyT
         YWaBQgWp5ueLccD6DyA6qCSnemDRLsJsa2LuKM5RzfB1/LTlBL9rCVXX8UmlghrbKkZy
         WceMuZCQONgLIsO/lsWWpqdlLeItrFOa/+4GzlOMb2fezHzYFDSw+Kk7mfspd86gtf3y
         6+pH34RooRWoL7+Of5CQEAzeuApQV2GUHSiVqEEz50hakX/ghoFY1Zb1wzFnCYSFDIC8
         BL7g==
X-Forwarded-Encrypted: i=1; AL+hErEgi/JDf+qx0kn5UB2e1YVjM1Oce2vLEeiml2g+cY6vq4eWx/opaRhrIjWlA2j4FByAYQvfvP0+YcU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QIf7cD2J4r1Wb95IoM2UOH1csFOUoYWd3AEW8sQbhk4ph9lqI
	F5c5vc5UJfIJAGoCpoSc5HCp5u7cbmOrJ6UXy2+9QjcSbysU19++7nAW
X-Gm-Gg: AZFdTZePFR90gyyLHpIeiLPlMQBkPIUBuAv1j5GosU9zOugVMDeyZpz+gSQxLBzlclR
	fUlLqNULWO0DS9XR8hZamj3O2/EnlPkRk+4ITD3pbuJfQUYuPJIvjM7MIzN2+c1juh3cIhyMgM5
	pK8TkRITG9sC40hexhnQtQWIox/EZyfy6aA5Hs3Gt1qCwLNp7b45BVmC0yNDipzfszfguqMXQht
	jGyIq8ukCTG0KoCRbVuE3L37OE5eSoLz5YspsEuFy9NfhLMLGrUPYni6ZmJuxCbE6VILha/FXE8
	5xOLSy6ZNMIf/LiG0mimbK/eazL86+/uWZCu/qg0ui6UVTFsMe37VRJL1pdzkcE/fYqDDM0pkBT
	/nllWXcdxBGY++/A4bHkObxd4GiEQSdybv0LaUGr7U8E/zsimK7zYAohy6SY5o+jFXWWtVMA845
	dsUVjCLM0EL9+fW07uO4GftNdj/KqhfQCK+T5PJhcvY+W4K/2sx1Sile+i+hmlSw1L3XPFUGko2
	r/5yR9ch1kZKHD1Vf7HmVlWoYSDfGLeiCRjWyHplzj/Xy4B3ByTErh6TEl13YDPxrUd11ECvIUu
	TP4Bme8s1+6Xgbq6oNgQds1RPYo=
X-Received: by 2002:a05:6000:178f:b0:4bb:c85e:d565 with SMTP id ffacd0b85a97d-4bbc86e17b5mr14733028f8f.55.1795821305534;
        Fri, 27 Nov 2026 15:15:05 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm45269880f8f.23.2026.11.27.15.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 15:15:03 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Bean Huo <beanhuo@micron.com>,
	Stanley Jhu <stanleyjhu@google.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Georgi Djakov <djakov@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 14/14] arm64: dts: qcom: Add Samsung Galaxy XR
Date: Fri, 27 Nov 2026 23:14:45 +0000
Message-ID: <20261127231445.3623202-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87280d80-9047-405b-8dcc-11276d34d2dd@oss.qualcomm.com>
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com> <20261125-halliday-dts-v3-14-5c8311c0b70b@gmail.com> <87280d80-9047-405b-8dcc-11276d34d2dd@oss.qualcomm.com>
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

On Fri, Nov 27, 2026 at 02:58:40PM +0100, Konrad Dybcio wrote:
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks for the review.

I've implemented support for almost all of the hardware in my
local branch and I have found that the headset exists in multiple
revisions.

So, I'd like to make a split:

rename: halliday-samsung-xrvst2.dts -> halliday-samsung-xrvst2.dtsi
add: halliday-samsung-xrvst2-rev22.dts
add: halliday-samsung-xrvst2-rev25.dts

The .dts files will initially contain only compatibles.
The real differences between the revisions are the DMIC drive
strength, the display panels and their supply voltage, so the files
will be 'empty' until I send my sound and display series.

Is it OK if I send the split in a v4, or is it better
to do it in a follow-up?

Best regards,
Stanislav
