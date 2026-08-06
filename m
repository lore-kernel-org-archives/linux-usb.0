Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DEE3290A6;
	Thu,  6 Aug 2026 03:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785987731; cv=none; b=YuCqBLEn1Xekfypi9U0peu1vp21qlVEsmNHuLTybyEU+zAiwHbp+xtvWsXOFUlRnyqXZbJeg7oJipKC0ModcNjkKUBsFGfWMoBUF9z3I+4GbYNVmdp52S2YPfCuymxixaTKpRY/VRGAiYO1sTBX0VCwMsWhl70Ftdj6tLjN5Nt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785987731; c=relaxed/simple;
	bh=AzBXOUYI6IgMlXC6bgA/YguS2fchCRY81yq5mPc5BTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h8uit+h9nJFl9xcIPpiRQnEyJtWP/+Up/lUcrKw3SupztRCnyFv3SnBh0UWxErMvIeoOmLesyS0sAHSYkjP5pAMXJGGCbFe/kQJiBT7ILa8GJpuxZ2AOhSyAjdOEsNuOhDBTrJmCaIDVRH6F1UFz9YKZXOrgUIxg8d+nQfl1s48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FL9JlBoT; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Z28LJEF8; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="FL9JlBoT";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Z28LJEF8"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hFtPk2BMyzMlM9;
	Thu, 06 Aug 2026 05:42:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785987722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cur8varFAoEuT7B43Bq1iSaOPFyr6JxttrEEVsW8IqI=;
	b=FL9JlBoTRd/I9amtzG7S+2rpmttAOqCdA7mWayUOtJTcqdivOwZA037BFPoyYNI1Za4Ear
	lyhHMT/nILtTuvS9PZSMM9Gr13mtGyAG8N8+hdSP0br+8BuR9EfvVwF/C3naPdv5QVIq9y
	QXXLYFiKQK1YQM9CiGlQrCpJFMBNGEVhsizZbsiZ0XQom1c9moLMlFTBH3UB6n5SGybHUD
	xrVeuS2uvr47sZ14ewotZtXnANN20Yya6T+Eg2+rxZ0ZuJSHqHZRuhUTR4EANazjnD6VVO
	RGgtNIec8c84tJga6H13fCu+V37LGLKzJ7zSV5R6RUI3fL2Amq+Zl9hCzBQqBQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Z28LJEF8;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <a0b64099-11e5-46aa-aa92-32b356a6c76d@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785987720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cur8varFAoEuT7B43Bq1iSaOPFyr6JxttrEEVsW8IqI=;
	b=Z28LJEF8RjExeYYq9diKJ//GYX0IU6bN9E616TWEop157ELqSghTYI8kx1CGdXZFKKDsT1
	poAVp1ujlc1vuzXo80KRCaQG2BUxYDWil/YeO7NVmCaIevd6XlUv1RwCVy73x26UhC6SZJ
	8NSQejTrDz4bE3GPmDN4G5KXyWmJ4epULEJJvBC2AUGv9AAA/ysiLzr154+Esgd0CoOekk
	teObqbtyWwTltWotwY6zhyXO4Uqe4njZVYyMneWTSqbexldT94gJ4QCgHEM7KJj9fKqPtr
	g5JbC93lSinyX3YzvasgfmHdmZjuMZjJngVInwe/xNLGNxwTXjr1oSX/SNn0Vg==
Date: Thu, 6 Aug 2026 05:28:26 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1 2/2] usb: dwc3: Add Renesas R-Car Gen5 DWC3 xHCI USB
 controller glue
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Thanh Quan <thanh.quan.xn@renesas.com>, Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20260728011656.465040-1-marek.vasut+renesas@mailbox.org>
 <20260728011656.465040-2-marek.vasut+renesas@mailbox.org>
 <anJ6HkPgDb7I4xeL@vbox>
 <CAMuHMdVQRJv8zoQYmgiObivaOoOBnE53mVdF3hPsJBK4bu4-Ew@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVQRJv8zoQYmgiObivaOoOBnE53mVdF3hPsJBK4bu4-Ew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 237e2f7098ca812b4c4
X-MBO-RS-META: mowuoba1iznn8rozze39qzma98jn1xyj
X-Rspamd-Queue-Id: 4hFtPk2BMyzMlM9

On 8/5/26 9:53 AM, Geert Uytterhoeven wrote:

Hello Geert,

> On Wed, 5 Aug 2026 at 02:48, Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
>> On Tue, Jul 28, 2026, Marek Vasut wrote:
>>> --- /dev/null
>>> +++ b/drivers/usb/dwc3/dwc3-rcar-gen5.c
> 
>>> +static int __maybe_unused dwc3_rcar_gen5_suspend(struct device *dev)
>>
>> Avoid using __maybe_unused. If it's not used, remove it.
> 
> Whether the function is used or not depends on CONFIG_PM_SLEEP ;-)
> 
>>> +static DEFINE_RUNTIME_DEV_PM_OPS(dwc3_rcar_gen5_pm_ops,
>>> +                              dwc3_rcar_gen5_suspend,
>>> +                              dwc3_rcar_gen5_resume, NULL);
> 
> As DEFINE_RUNTIME_DEV_PM_OPS() uses pm_sleep_ptr()
> internally, the __maybe_unused annotations above can be removed.
The __maybe_unused is dropped and pm_ptr() added in V2, thanks !
