Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D3B315D23
	for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 16:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781799321; cv=pass; b=OKPLVih2BAZ3cMBF3n3R4VePJEZAcN9GoccMug7/SvkyYRbDUSb42VpGL8O96e4FhT/OLtz40XzWLCN0j/SfIcf18kz0ggfvbRdjnavqMu1hHAeyQ+PyKLN0t0WwpnTyuS5n9327fqDw0wXAWf5diNLpplzKOf2QYhyhzIL7/B4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781799321; c=relaxed/simple;
	bh=KvE5pNDF76+7uly7CA7C4Kb/QD4z36dTd3xrhDgBR7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JtpUqKqTyFtlAHmlSwD7Lg5BOxHhARudC7Uw4K/YxONHfk32wwFeCNp4dTTpDwwJRYWjdre2HkGvFMl1rUl5wfw6r6/edJBFpf//2b2Ag/I0qnHe6KWvWCTOiuswii2kUBV0TkspPfbGvlrFUQ5w2+yXoJga3JTS5MzT+vDkV6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efmVcvEA; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efmVcvEA"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c07fd4dc2c8so87452566b.1
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 09:15:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781799318; cv=none;
        d=google.com; s=arc-20240605;
        b=cSIqmEZIuEhc8eVviupwYIds/Mx/PauNM9WYnHSCp/8sYVfuxwMjMb5YD9fuzsHxg1
         WNYm0Wj6xJYrLOz11ScRW3SbA2A1wjo+FUP7jcuEd3zo7z6lUPZSID5S+vZjEdL/WrNU
         ENMHyX/xvOpizNl8WqLgCH0wKhPYCn6jBD6Blv212XAkhuQxva+xpY8Y3PQEKNq2PUJM
         72fuP/Mgxrzxk5gsO0rq26Vz5w14gG9kkH3hzxFpufw/TzIs4s2/bchy4YDUCWJP48zJ
         cdQuVKIeheTtgYV/Xd79cOsJdy5HxLA+gxaJ8RnLE3xRJ3noD9JbWapkbdeI4Yhv30qY
         3hxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KvE5pNDF76+7uly7CA7C4Kb/QD4z36dTd3xrhDgBR7Q=;
        fh=FqMmfj842c54JB2JKK/44Jj1D8bydyquaKubpgFhZgo=;
        b=cgzuiP+KUQwHz/DsoxFq4KccJBVcYo2wZcXgCfq9puzbM/4VHTURy/4d588UkgRWnz
         tDwHTU+ji2l2r95AmiK7dDpvFEp80BD2JPznnBc8ZQ1TES28YaB/IGyBWnQrNG5Fs5Wa
         UUq6EA8tefHjvomj8h4DR32GL7najV0AnHsDrx37kwLKD8i+pYGW8X42PxhaAomdmSwC
         BSb7frq0HA2QfiBnQyVjrdQYQ0rr6k0n82sSb2bvDM7c2cCS0nheRvfWmtqFJ3a+gxQq
         vuLholGgwWboF6A+o/pnr/Fp+drgcFinpqu8s+3b/CmMjnOjvXL/INNizR6apLdGkPTU
         fjPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781799318; x=1782404118; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KvE5pNDF76+7uly7CA7C4Kb/QD4z36dTd3xrhDgBR7Q=;
        b=efmVcvEAMX7kK8v/fFIk9129vcw3Zui8NiKWoQtGpPsloowVhBp538jviCcuqQRahn
         6Erg4UYtoXE+KYVOy1amMGqa8BKzaML5MNXz55UgILi1d67nhwoautV9RB/hW2nB5AB4
         30RyoaBLPvTrdqspEBpV9bsC0Yz28A9BDknAbcnK2G9kuhqaQuV4KXsUsMRylV604XY9
         fMEB6BNLP2pAxZ5K7Z+FtlTybbDm1oM9ZnVDAtzhH/zIMjrAJ+l/hoX7o9M7MZrzDHF4
         NJBu5xW2oAIChZGCnOdYEPxZJS8hB/qiFXQPgh9OZ/eoh+kvU0hJO83tHvJeRER5UQu3
         h7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781799318; x=1782404118;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvE5pNDF76+7uly7CA7C4Kb/QD4z36dTd3xrhDgBR7Q=;
        b=R3yKQBpJj1tYZt6Mx9Rh0H6GdyBfjyiT1SZljRv3M52ZaetJQ5wSwgXjB87hyUUkyV
         iTQIY3gSI+KanY4jf0cfaY/4aVp0vbHPeHQ3Xa4ZMO85prUQ76p+EbaOGeMNJvqWFopc
         qcKowhpBVVoJib6fj/fnKYrwUVmyUe00MPEilasoyoqsEEtHafZH5g5ZefC9lPz+am6R
         qZa8bA77mo8J+yi335ZgnzMyJTD5RJXXSWhNvGNJh3OrsVdpZm7VNl9Wa2/SYLmWknKZ
         tl8ZXpbB8SVkA5sH6Sfvzg3isrQMMsZnXGry305yZMNiGI7Qa427H/qUmgALEbUZDy6V
         f3Hw==
X-Forwarded-Encrypted: i=1; AFNElJ927SkGzl0/eV60s71tMdRP3dwlVZrisX5lzd7SrqRH49MZmUh53yrEvLYML9/mQwI/UR6kwL6ROQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMC5sSBaSvdUAc6YpowKHqvsrUmIGpyub0s4S5JIL6lJY0yO2D
	r4LZu1Fgj4XDBn6JNJIME04Grcz/rtZaTH/qYM86sLHSGugNn4A1U/BvMsA60rT4ZFOpZnrdL1j
	joZF/e1WnH3uq1Cb6ZTFkbxqYwHmRVVo=
X-Gm-Gg: AfdE7cl/PngyGi7phtVKE8Hp/aNSGc/O712YGSFMuBU+ckigOhol3NwUlikGMx/phOn
	x0vZgT8vEn5Ue0kGtqb0rbXKSFRV5Oipd3U3bzlAFjLxXe80MOCP//56T98pcJY7DQR4HVoGKRn
	EjW7fM0DbrP8fqxVnNjS2wMA0Pk49CmQSc4j458tqST3B9kWZbR8peuYPVQZDdMTfGvL+Q+Q4Wa
	QkgPtkauhKLY+PjhcRPh7pCUpaS3GGupUvgcxJ33A3PV26MfPRWxIwIWUgVgAwkbj7/wJ9NISvV
	29N/1TB1
X-Received: by 2002:a17:907:8dc3:b0:bfa:320c:b93b with SMTP id
 a640c23a62f3a-c074c820792mr251372166b.25.1781799317664; Thu, 18 Jun 2026
 09:15:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3b79ba92-1c51-420b-a5d2-8a358cafdbf6@rowland.harvard.edu>
 <20260601084846.433bfc51.michal.pecio@gmail.com> <CAFgddh+dLnR=AuAU65sxqsxAgqLYX9i0OiX3Ys_sPH+YeZuHVw@mail.gmail.com>
 <20260602193047.5fe03b8d.michal.pecio@gmail.com> <49acc9dd-9d2e-4a37-9b41-de5e16445461@rowland.harvard.edu>
 <20260604125323.1bcb40d7.michal.pecio@gmail.com> <1996a7ac-2670-4124-b855-6fdf0c9999ad@rowland.harvard.edu>
 <CAFgddh+FU-8xQ850GTkxt08R8ZdAn=kfVZz7bG8-aJ47kSy1ww@mail.gmail.com>
 <45f91c9a-e4d5-44e3-a0d1-9727806aa00d@rowland.harvard.edu>
 <CAFgddhLAdyoBFtQ_G0Ys4dJyaxCFAbf0G3-xSkh5ttxth-6aog@mail.gmail.com> <a53340b2-4002-4c5f-8a70-c6cec78159f8@rowland.harvard.edu>
In-Reply-To: <a53340b2-4002-4c5f-8a70-c6cec78159f8@rowland.harvard.edu>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Thu, 18 Jun 2026 21:45:06 +0530
X-Gm-Features: AVVi8CflpQUPaHB187lJrSKviaz0QUiXIVcPrYRU4plIbTszaeX7spt2ZJuPWvk
Message-ID: <CAFgddh+XhOzyGWLvSc4Ri2nDi7n+9EmS7B4mbuyb5w486cRzNA@mail.gmail.com>
Subject: Re: USB: Request for guidance investigating configuration descriptor
 enumeration failure
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Michal Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org, 
	gregkh@linuxfoundation.org, mathias.nyman@linux.intel.com, 
	sakari.ailus@linux.intel.com, katieeliu@tencent.com, 
	johannes.bruederl@gmail.com, kees@kernel.org, dengjie03@kylinos.cn, 
	limiao@kylinos.cn, wse@tuxedocomputers.com, dev@a1rm4x.com, 
	vahnenko2003@gmail.com, cs@tuxedo.de, lijiayi@kylinos.cn, oneukum@suse.com, 
	bence98@sch.bme.hu, eeodqql09@gmail.com
Content-Type: text/plain; charset="UTF-8"

Ok cool! That works. So I will just add that old commit hash then for "Fixes:".
