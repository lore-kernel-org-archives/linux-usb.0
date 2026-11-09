Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243864;
	b=Eia3F9924ZjTIc4LbCHc2kH+tOcfTZEoUL8kdi5Cyn6pZ9dN8JJ8MEDINNSYrQLcNE4m
	 eL+2iWUMxLWZeidF6cm79Xrk+eUFLasydqA+itwPR4gFiG9f2oRvFdjIAJv49A3WFdvio
	 bB0yNCoIfd9XqpRhzMAAJQxSanh/hp3ZQ09Cm88NUENrcxHjqQw5+TAzNcl6PplRgZK+A
	 aqI1gw45rwjfs98DgkWYyOy810wWCLToJ2Z6Cdj8ja0CC8+4DHOzfldxZUXkaT/4H4Hfz
	 kQBCa3wVvvKW0GgTqmeAgBOaohys8lgB/ENfn48Z92rRTKdqKs1W1Q/mGsZc5y8pazQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VmhgsZdfI41q6bSk6Ws0aoyQukpnInOpVRPvZF0DgoY=;
	b=SPlqCCQSczIGreshxKVLe+uja1ik1mb1Y1htWnyeUr1c4qc0IWIP+r6mgqIfkRQunzWz
	 rNawPH4/asfKfQJjtTCB11lm1ZcANQ/Zh/Lwq+x8A/GZHyrvRx5u7rgwvAJORLZaF5yQa
	 noCExBOEnnox8VsgW6M44hbL+p2hHetw1Yl0TV9wHpjyYT6AMzCTPXJwAFXMeCbLNRwKs
	 uSj69Q8mcFJsWod6LW6vqFn92jgPZFzo4Fof5cCgSoolmLq6nPJP1jSI8nj/mQXQCyL78
	 IPcZEaO8xEng0mXlYAoTHoyxSuPFQ3rkizgBO28dL6vFyLPSDQYwVy9AyYSZife0Hdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INMhwymN;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517BC606A335
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 17:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 517BC606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INMhwymN
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so1604999a12.2
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 09:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243863; x=1794848663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VmhgsZdfI41q6bSk6Ws0aoyQukpnInOpVRPvZF0DgoY=;
        b=INMhwymNUoXRa1HYjajYs2VDNOXoDzVIp/an3nVGMwTgqTKKIXcrYlToz3KguYeb2w
         0JSHPrAS4tp1u64diFxx98ot8r0Zd994Q5w09w9Wo7hRC/DtQLXBMMh5MnMbGm5sg/9+
         bfSbd1NNz976A12xlmIC5rBcyt2zgrNxYngASmeZZcCyhLh9b9uOIuPyOYnguxqTaeNR
         9hUslwRJlODcmrjO84K/MqZr6AW6G7obz3aQhSgpfQbvfDlBiGQqmaSqVNfiSLuoobIb
         SEhjw+R7G4bUMif5HGg+3AGlsX3R7zQQDPntqdP45khUAZLh8+Utt3l4+Gfo8W0GMqsn
         XheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243863; x=1794848663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VmhgsZdfI41q6bSk6Ws0aoyQukpnInOpVRPvZF0DgoY=;
        b=Ti99t7OK9lxqELPH7NuRodUNo4PHv8u0VU3/N0hHnJhOztGK9q46FPw7O6rjq+Wlrk
         o92J1XHcDYTIIO3MPPZiryHvDroDBwywfosof5ytq0bxFyxzHxHWdTsG7LRMI8udQ8tO
         9hZsk+s0DeQZzc/BuQhY8+09DIwJVmQSP1VZWnJDPs5lWDz5oSLaEDh/KmaRiyFpg3OY
         s32gFmYtK2/w/HQtc1utuqyx3FNxbueTEhcN74kriaXMp6gPE+A6KJljbECzJzOzc0yq
         N5B03iYm+bHTS+8cBJkatubs/337GS/MJaOUMwDnEkx5H5OF3h3CtzNA4MBC+w1WrBwN
         mhog==
X-Forwarded-Encrypted: i=1; AL+hErG6p//hgPGq0xKh+l0nCOCvnfSW+SCZd+fNOHepd1EFwg3Je7+kpH/B4vo9TsUPP85Q/LEhs/vkjs8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+d6vXP4NlEcAnl2DXN/jx2nXGOV7JzLW4upSWjlhxGw8+V/wTM
	6aPh3Yq7FhzYpMtZqMpTTGPy2wx7bfjncwaTvIQiQQe0FyXLF6a/ZtkI
X-Gm-Gg: AYBFou2+wKDTe55lL3jDU9NuJxhIAmVprGudR8W4YijO6aNn3R9Key5HuAHNwuY/Gts
	jPAGlLgNGlVlOrQVzWWoOSM4d5hw71qVKqZQIJ5dnwbEwdhqt+6wEKIAhBzpz0j+9Rm/ODhiVsY
	iOAH6KLuFfYJ7wxv7ryxRMS9og/O27ESNcp5qm6Equr5Ds9VV9g3VfebnmbC4yucyXMhcXDtxEw
	fStXNQm/rc6RTgokiVMveaRdtsD+W2hB9QhcrutRE+9LAzjSs1zZlyda1ZIIvoK7G88snoDv8BG
	VXsXGNz5gN8kXRPkjmm1P0NXocYH9ArBJoUZfClX2f7SaIQf8qI14u8yZOBG2Ur5Q9cwoI0ZKlh
	V8szmpea8ugVPmHk06dk76W6pik9JFVsC6HcVcWJ/yVvbUusYWrotZDgg3x5dysSaR5mCTXdQJw
	U8Fjxh33gLMz9IVDzLoeAMoPeXYhY2hDCXEe1OYC+9u1AGd6zmgnRGYIMV0pwXm3Fpcrg5W167w
	PJu/JkJfeKf2exc/Fq/6u6godBOVcr6rratseRLHqHz9+agYPqKg0xogLyS4CIa8TJdLnD7f/yR
	1z1Jtn82cKEhjgqB+LHVPrCFBRM=
X-Received: by 2002:a05:6402:2356:b0:6b5:7792:d82c with SMTP id 4fb4d7f45d1cf-6b756ad7482mr185305a12.16.1794243862514;
        Mon, 09 Nov 2026 09:04:22 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ebe31csm1878937a12.16.2026.11.09.09.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:04:21 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Lee Jones <lee@kernel.org>,
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
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 17/17] arm64: dts: qcom: Add Samsung Galaxy XR
Date: Mon,  9 Nov 2026 17:04:07 +0000
Message-ID: <20261109170407.2073295-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <3ddaacfd-59c0-4d87-9b8c-2caa85143393@oss.qualcomm.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com> <20261109-halliday-dts-v1-17-289114ab8197@gmail.com> <3ddaacfd-59c0-4d87-9b8c-2caa85143393@oss.qualcomm.com>
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

On 09/11/2026 16:12, Konrad Dybcio wrote:
> On 11/9/26 1:33 AM, Stanislav Aleksandrov wrote:
>> +&usb_1 {
>> +	dr_mode = "peripheral";
>> +	maximum-speed = "high-speed";
>> +	qcom,select-utmi-as-pipe-clk;
>
> Is there no superspeed / dp altmode in hardware?

The headset supports USB SuperSpeed and DisplayPort via its USB Type-C
port, I just haven't brought them up yet. It seems we need a new driver
for the Type-C controller.

Stanislav
