Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F1C37AA99
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 10:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939461; cv=none; b=hfL35xZbshnSwFozJuZ9T0ZmCdum8Frl2vRwv7pNQ7PgIGyp8ENPHtS386aPRlgEBcuZ9j/PxErrl94yTXU0bYJYW8qwuluPe+MhgMEUN57kMNMfce0MsOMfhdyQQhnqLIdX0PE5poh83XRdD2VNUiERpIyd14awu7q+eMfOW3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939461; c=relaxed/simple;
	bh=ql1aixtFHgHagK456QoyfJb17civZ6SYqHliyTlFutE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KpRSgHGVWvIveE1onNLcw4Iz09bBq9Um3pf2qidIaTY//vZh0pL901b7DghFtYxpAqMiAbCrLNcDFaNTZro9aWGqqtCJMCuSwW1TXtO58ryiEjyePHKisnh9ODctxz0CKO/4RzNzzXusYw7mZdUoahkZNdw8h4LPYFtHfdZFNo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=C8NnTdFo; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="C8NnTdFo"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493c19bad03so26891705e9.2
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 03:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783939458; x=1784544258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m73LA9kiESl6YEbNksXXgLixqGiLLHdAkwhmEVZ3prs=;
        b=C8NnTdFoazUJ34f3BwwlaxwBziYWZ97TlM4FC8SGpNdyDWGb8gNXcbyKPO7m5fYna6
         RSbjhgs0wiyHdeYBS7rVw8BEFsmt8jYT+eFEuNNcUcJ74xr3VCgk2ceSqN5e0zwPe0h3
         CxqsDrjiWAziGe6pIcs8GEjg3/tkWEZ591fJ3Fw5c4c4jgI6XfMrc3rxP0s9EC8ej6iq
         yTFe3+bmMz/hDIPBTc3Fj/W03E8Mq+byFLk1xC/gnlRTW8NIEx253XMnXPNdBFEqMR/h
         9xop+UT5N1SpTT6OUYE0rExJ9XcZTcO8eiMWElt+7yqIbNAbBVMkQV+eAXhS0oFXRl6F
         Ugsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783939458; x=1784544258;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m73LA9kiESl6YEbNksXXgLixqGiLLHdAkwhmEVZ3prs=;
        b=ZPTcXK0RKZ25Nc7nWL0HAQKNTafBVvHUM7HfcuusLD+UG0UUxk+zrvOwwcYSyVF4UA
         J0wjjiJ+iFKeM/nlc43vksmWj53P0JjbxTyGhsozTsJm640llwFlQ/WGdSx4Nk/RoR8K
         5AKiTuK5v9zcj7vYvrYvcIDhHfWLvGrWdZZLcNEPQJEGZ9EzgAgDYfq2Rjgm0X6PIX0/
         oigKD8S3v56qc14D93Vl+BUiDQ1L2jaBoZ2VzJkPXt35zsVU441Poz4dffAi+Hh1Nyxh
         seKNU/wROm5+KQ6ZTW5X5zFwCz+WH8JRPC8rG3u+Lex4v/ONfLgsvtq/MZUkHq8EefUF
         F9gg==
X-Forwarded-Encrypted: i=1; AHgh+RoUOQ0s0jtjLFbtTyYWNfKmO/pHk8P2xorDHR6smeC3C5wLNQ027gzly36AoWqNsODAcZ9ghxcZE3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt9bxmy6nIeYxeC3e+WIMr8pSIgqL9d1spY8VwMEBomNcJnpj4
	TW+h/UdYu6FjdpIyueVs1hIcTMudwvxbkPmdKh1uduX26ULOwUIjoT43SLYpNH6humPpJVeFAUu
	14Hd7Mws=
X-Gm-Gg: AfdE7clfY7fFyFHBExgp8tN1HnAJKUv1LZXCQFsaQvMWzP/T12QGiJLAKVdfNYjvxXL
	IKUuJtv4JWbOiSMFh4E3d0cKVP8FkhMoSeJwZ1dfuRZdsVJ41ujic1X8razBIAPnj7E7IYnsQ0+
	WtsAX60Qgm7F2K15m55+u8jH7rE19MxBoJaAdyxziVnXgkCVw63bgUuiLmFs/n07DpP72rDMHf2
	IJSXLVVPlcQl1IZMglAcMd/FEH330awFIj5J33lG/GuBGjlKNog/mh1YdRmgF+D6Rbqn1unRSzP
	iJ0JNO7D7FfrAA8TsGE5IKNWJo1mejlHymodcaQuTKBr6heEqI4CGEkv8GwvBkA23KDJDnGQcu/
	CUPjmKDLNfj3KmdGEJ237etHwAwmXH4zdGGwCzP1fqq6mHGVW8TjmTmwj/vGEagrsp/gtlwzZE1
	qEzy9wpHw+ekwAAV8SEXxxL75Xw5LslC+AnL9HwVd+PyotoCfUuw==
X-Received: by 2002:a05:600c:5490:b0:493:d2b1:48c8 with SMTP id 5b1f17b1804b1-493f883a6b6mr83661905e9.33.1783939458096;
        Mon, 13 Jul 2026 03:44:18 -0700 (PDT)
Received: from ?IPV6:2001:a61:13ba:f01:2ca8:b242:796e:b61? ([2001:a61:13ba:f01:2ca8:b242:796e:b61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb74835esm380749975e9.14.2026.07.13.03.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:44:17 -0700 (PDT)
Message-ID: <b775e3e1-af60-4291-a875-7185dc29769d@suse.com>
Date: Mon, 13 Jul 2026 12:44:17 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: serial: fix slab out-of-bounds read in interrupt URB
 callback
To: Johan Hovold <johan@kernel.org>, Greg KH <gregkh@linuxfoundation.org>
Cc: Jiale Yao <yaojiale02@163.com>, linux-usb@vger.kernel.org
References: <20260712170012.3503601-1-yaojiale02@163.com>
 <2026071325-onward-sabotage-13e8@gregkh>
 <alS3pmrV-FwEsVvA@hovoldconsulting.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <alS3pmrV-FwEsVvA@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.07.26 12:02, Johan Hovold wrote:

> But looking at this again, the check should be split in two: one for the
> struct usb_ctrlrequest header and one for the modem signal state (inside
> the conditional).

Not just should be. It must be.
Doing the same check for both cases means that any of the, presumably
allowed, messages the driver does not care about will terminate communication.

	Regards
		Oliver

