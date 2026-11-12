Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483606;
	b=VtOIAo74ui4lzbcrFzymIzKJr9E1IBb5lVVoM9wta3ArO6b1OD2OfZ0D7I2fOr+xFIza
	 k9V8bapkIAllqsDSp3+GigozI/Sq4h/0hJXkOy5Lff62xLTB+QYwBScbtdrU8etD9QLz2
	 kkeU+dKZz298MJdW6N7AF2Rnhij15sk8QnGq5K+Tnqqjwd1ayfHA4iN6pQwE8uExrSNZ4
	 aiSnBgmwS68jKzG7jdyKi0Kp1NvvL54NDWguttXv3lKILhUKMm5X3/ac3WYpWC3heHQx7
	 mJ4T0plVAzyCWv+E5nbzmP2AavhGsxd93z+rjF1vb3lytoBBU8FTgyMVCYxgjMGU6Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=VmudOlYzKuyF8nJTc3mFuzpqRfR0BM4YC36DH+65758=;
	b=KEZrsYcPYHd71j1QVUHB89BVx/MCimBNqZ/o3lvH3Erwm6U22WuA/1tNlghNkrulq2WP
	 OIpndRpnKntTc6w8c6yooQk35Vp/nJMuPYzAI55hHplodSf8I/8Cmaw3pDufCMAKmGrpC
	 uQ8KSgbA7bDzIPlfFTs7ffbkO/OuGbFkX+a86evfdk5cX4/WZTK+AUq6jZFjeCt17i351
	 /uL2veePV0hEUag4RCLwA3pHbkjrUm7IgG+AjlPaCMEOkXYEdNZXCzRUj8rFJxQNRnDnG
	 4yHnD8q+1u57RjzBAwn02FTlnGIB452rJRJ+HJ3jG9nYKEC+NlQnUgE9igHdt0ASViQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cBHXdmWj;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F126F606A880
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 11:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F126F606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cBHXdmWj
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so6252206eec.0
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 03:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483605; x=1795088405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VmudOlYzKuyF8nJTc3mFuzpqRfR0BM4YC36DH+65758=;
        b=cBHXdmWjd5PSdJdALXlPRiY+Gbu3JtX/fpgTkexsTEU+e6rGz30LREHkxLTk9hiVrf
         LNUvX/eB2l+J/XOY0MkxUf+5Kgex5BlnISeCqF9cAkwhdL1n2e/Bj6VV4yR2WNOW6LWh
         BnKvmL6WOxdQk3FP0TvIftOtOvhKTOt25VzFUqWQ9NLJU5FQeWsyVSwW3QZH7XGbipMp
         4ks5bZwp7ffMV8HGSBP7/DlJiCT3OldVfB/TjvqxH3AsencJyTqsiKzKIx2vmQbF9Hu+
         XpcTCwevvEw81u3T8m35CJYbZFZabzwkeMUJZKdn1e/kQNAm8pNUIWpaQXb18hGRF1p9
         CuKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483605; x=1795088405;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VmudOlYzKuyF8nJTc3mFuzpqRfR0BM4YC36DH+65758=;
        b=aE+al6XEXRh2joDcxwIM4X148TK1qLOe0LQRy2fawAafjDEaFNaoV+ru6FPy2+VuAZ
         Iux1aeUbtebqQTSW11SyigTCAsrI+9g5RnHnnzq5no+kusWoy5wR9+hxMuVIkIVbrewD
         0J9uMMqVDVeEqHs7tqfnxcDFov+6TFRpprI4KgXT5i40OhttC/8JSy6sxDSaD68/u3wO
         y2SZSlZYYi/jNY7mti0pN4QAUU8Sb37720nY9HnA/v8y7d5xSx7ZXpPOshKIxQR46QPE
         Kkm8xc/1Lnr17Bj8OCQPl87yTFWEbR9BEzf06wf23zGCVQMf2a+iAbLqQFgwaI9ATndc
         Q1Gw==
X-Forwarded-Encrypted: i=1; AL+hErFNGQo8x7qeVp6cUy2EdPAtUoKXrDeMfk7GLfqJjqrcyqUAEQy0xbgonwvlEyjt1hduDlQ1mUcg5Ns=@vger.kernel.org
X-Gm-Message-State: APuU4Z9whrIHyxUhqkrmGuxZElOMxs3phmsC78HW4cCE+Xb9bCw9NU3y
	nxPWkVxDR74h8L5doQb7s0EZtLRxYpkAFqZ5seQG7xp2BegT1TTNImbN
X-Gm-Gg: AYBFou35bPXR0dG42S7rI24qPbZuzqjb3B6VkkD5FXXouRRagj1WOKsLvXOW1YH1Yvk
	zc0DsINYK6uotV3rIMtge9kxh5l7mrDAXr6K2UO6k1cKXZ5adb8P7ERfKLQr5QCc0kPFmrUQhls
	wa44oYsBRtqFGozcNSuN56WSIgE5l8O94qGWMi+NnfEJFFhp4KS4rkzS4c9PtuB87qAqQHikj6S
	GKzwRM2zCF70VjPTEN9fYzZgraWInD9bDayakLFLq2krT+2GpVpOTKXOqDed7GwXrUxO/7TQraG
	izDkZGOku4KV02bQYyv5GwV+PbS+3ASTa4Lhy0+gqJN+sKPaSQ6s6WjnmnO/AYFdA94nKRX9dRF
	OQjU18g/zqB43kik+OPNCijlcPp7z0uY3SrrII0sRWTxiLasWTsaLJPr7htyFTdVhCwrm1sRcjO
	iLtQPeo6aZyWt43+plBJLgWTcc06bcPIj6ehx0+O9miMyqzp5woa5kQ27R4kl0CuZRUgms1EHJ2
	twQrJpBRZQu9wXbRff9tMlp/eMnTLCz0b4cL79xDAOGpoxrkNeWGsede5YzJqgoPIwGegkJ+sH7
	6S9oCi+y/rFkdBup/AxEIDJLUt3iTKxutRIsLRWI2Q==
X-Received: by 2002:a05:7301:508e:b0:36a:1434:c691 with SMTP id 5a478bee46e88-37686171ea2mr4966182eec.14.1794483604509;
        Thu, 12 Nov 2026 03:40:04 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm50310345eec.23.2026.11.12.03.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:40:04 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: sashiko-bot@kernel.org,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: kaanapali: Mark the USB controller as a Type-C mode switch
Date: Thu, 12 Nov 2026 20:40:04 +0900
Message-ID: <20261112114004.182-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <sashiko-outbox-195550@kernel.org>
References: <20261103135057.1682-1-26rote@gmail.com> <20261103135057.1682-4-26rote@gmail.com> <sashiko-outbox-195550@kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 03 Nov 2026 15:05:12 +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Can enabling mode-switch on the Kaanapali USB controller trigger a race
> between dwc3_qcom_mux_set() and system suspend/resume in
> drivers/usb/dwc3/dwc3-qcom.c?
[...]

Yes. This is the same race as in your review of patch 2, and the fix
is in the driver. In v3 the mux callback no longer resumes the glue.
From the start of a runtime or system suspend until the core has
resumed, it only records the state. dwc3_qcom_resume() applies it
before the core resumes. v3 also compares with the clock selected in
QSCRATCH instead of a cached value, so a selection lost with QSCRATCH
in system suspend is restored on resume.

As Krzysztof asked, the DTS patch is now sent on its own:
https://lore.kernel.org/all/20261112113921.1143-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
