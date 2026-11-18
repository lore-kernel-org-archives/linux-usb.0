Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993497;
	b=XyYtUqva957iLFEPb+sxAaj7+iRJycG90jPOOs8OdtKJMq2dGkWAjQd/tCIFpLhTOniC
	 TsQzbYqbLYT4W6kPYJKXrKA3L+4SrM9UdEQxfQyV9EEBzWlEn3fVcVf9qJ/FqjGWq/hTV
	 2HzKJlvONy7o4aiu0k+Enl7wDdhfgefhtsoqzRY46+croKDKvmx+E0XLnSjcPNn7I6MjH
	 fW3hAq6HbEI8W31w+Zh/UOHgYJUNwwScvB1so6r8vpCeFsQ6cXlf8i4/Eem65RznptoDa
	 HRu+uaCyMY4Yar5HRPVBk1RVWTkolLPBmn89rmR56G+lyXTIcNNevPWQXftnrNf1pUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ikHBvqHTltfzYgkcvseG78j17406Yy1iULN84FAnASo=;
	b=qxc6hPQiNKx7lb/GuPo05D/1t2Tx0CaBxO9FzDoRDr7a2NikgcPBqhoAV8oWDx0IibCn
	 MA32lJbzNB5GNHp2zJHICa80y71H5YOB39Ce+zkh7DpsaYaUPDt2Ie/AWVLhaJDfQ7Rvc
	 tmFXRdzDM/TBlkhPqgsLKEh0Xw895a8Ok6XUx5Tp/lbgLOS5nCDAE/iw+vJKbVXvzlne1
	 OfesyivtqriLOcSTpMXxHylwtRkNOy2nvaogvwZCJ3rlg0oZV/9N/a0iW1AXNy2/RzDDT
	 JzOsfb5/ZG8vnzXLZ7IGHD4hMzEn9YhY31Qlv0f2Rqof3gqHUgW2g/MKFuiTOkclmuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JzTiRd7X;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E72606A31C
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 09:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87E72606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JzTiRd7X
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so5576675e9.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 01:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794993495; x=1795598295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ikHBvqHTltfzYgkcvseG78j17406Yy1iULN84FAnASo=;
        b=JzTiRd7Xmh8ER7hKFjYO81TwtyqrgIddRm7qGZfOA3Qrkzx8BGPGNSeji7qR3cIjIr
         lM9VBJ3Vrk0lSQImnYDCNIXP9LmAL0cFWHhpmNAaRsp3nf0n9kkWBUsd4L19Txv9gkr5
         Euza69uTISPttMDCvz1LZWQ1GI8Pdz3uLO3uVnxR2Joa9F7VF+hJr5cdqVBf7OrSjLab
         qBUryDXQlaREZ+pBOxG5x4AJiPVZd2CFKFk4cxhGW5+Es1NRCXynoClY4mkVVhBvcIjH
         4yreg/Z/NNJk8MDpWR55PVABMkc0fr8Y4+hrxajRvVdqR8gLaRlTy8Rv53106yIkNy59
         fDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794993495; x=1795598295;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ikHBvqHTltfzYgkcvseG78j17406Yy1iULN84FAnASo=;
        b=TQzrkr1sh601vX+H3M44gMmPuuJhiULuieiUySFjjuh4v+75U22JlhCUfIqb4RUG3Q
         mTNQa/W9KYpxP0P5LWaImatx4LcMr+2YDoztmw5R+ozO1oUNbo6AnBfFcgtbhAxE7B4P
         M96dynBLQqY9dUrKqnU7BTxIEqtB+0QtIzr1SInqCW0kD/ieEAs1w7d5BdN/1GZVSlkC
         D37lipvxWPWNck5B+IY+v7xIOihtY3hz8KSp+/qPNYseqcUHK70WRLzOTnxbgx7121kd
         ZeO4RLdIZejW/FmlqjRdp0a755y+mw+131S5B2sIfq6qE/G2oiDUWmMjR2Tr5ffYdxZr
         hknA==
X-Gm-Message-State: APuU4Z83KULegSSqHwvQYpUQ1V04rU5CYHU/KNE71sLE/c2mLzF4KkGY
	2fdI7hbuwcM97US5EJf49gNF69+CUc6ZhGK1xR/EgGbxWM7T66ruIUWT14hl+LMV4H54ybU/K/R
	Zko4Y
X-Gm-Gg: AYBFou2WG5Bpm+a1ultZavUoEYzXEfx7c1YFHvBvDqKk8dsZj+Kx+qMNlaz69q3DGDZ
	EJtPci3ZDSEGWmJOEwiWcAh+fJ61Nkh+ADittT8UrXQvHFRtT6G0rBzPkocvJeVwe6jZHKMNcgo
	tqUMfNzpi9KYnz8r+XkGrAsgnk2Vwd7WOtvmmBKJ3bqpQiszg2VN/pij7myMkNKswp5nafvcVrB
	lm2LQgZiLgaBcWdYJFMCOFqYeYNVUpiImxiFMdESUwi+4cy1Ph1UgV23iGQCQBe4pWX2MNIG2mO
	DNIAltKULZl2FXEauEx6dta9MBz+nSHzFpqaE8vNbz29HxHByhwUHvZ3ELsk5wVESKuP7+OJMzM
	gXK6CqMhYE+lmy3G36TeWCXUtAwg8k0d8gg3i5TGltGdPmw3hMxX7iK+XqwUIEZrTD3t3d4kFRz
	gmGSaU1P0kDjsMAsGbXiw085Vhpi7UOgdHBqYaLMsJVHoFldNmlVgbjiN/wDyqRVpmwHVYMmVgq
	+a7idzhvyPNS+RzpButpAlBaf0nAN2YMhTLmWxzRydhQyfTFynJFJuvvay63uTJZ91mNuanJfP5
	/VGG2CBCBH3ftky4JFQarVmC40jwGEMdggkQjWiqhVxm26a8sxCvhGLYMTFCGGFkuIyGt8yz
X-Received: by 2002:a05:600c:c166:b0:4ba:761:97a1 with SMTP id 5b1f17b1804b1-4bb7da1be47mr37416565e9.14.1794993495037;
        Wed, 18 Nov 2026 01:18:15 -0800 (PST)
Received: from ?IPV6:2001:a61:13d9:c201:adce:19da:dc12:b6eb? ([2001:a61:13d9:c201:adce:19da:dc12:b6eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f7eecsm237375625e9.3.2026.11.18.01.18.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 01:18:14 -0800 (PST)
Message-ID: <399a19e6-9dc0-408f-89b6-3c326bb07f30@suse.com>
Date: Wed, 18 Nov 2026 10:18:13 +0100
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: uas: ignore UAS for ASMT135x bridges (174c:55aa)
To: Eddie Chapman <eddie@ehuk.net>,
 Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
 gregkh@linuxfoundation.org, usb-storage@lists.one-eyed-alien.net
References: <20261114174932.53895-1-olivier.kaloudoff@gmail.com>
 <e2ded4e1-a7f3-47d4-a3be-d7c6eed3e436@ehuk.net>
 <5ce29ee1-ea5e-4ebe-9a9a-f16844ad7b78@suse.com>
 <13c443fc-cd23-4bb8-9aca-71b6b0f7b09d@ehuk.net>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <13c443fc-cd23-4bb8-9aca-71b6b0f7b09d@ehuk.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17.11.26 15:41, Eddie Chapman wrote:
> Yes totally agreed, if the firmware version cannot be easily read from the device somehow, today, then the only and safest option for the kernel is to treat all such devices as if running older firmware. I mean, it is definitely *possible* to query the device to find its firmware version because Asmedia has firmware update utilities that do that under Windows. But I've no idea how. In an ideal world someone from Asmedia would one day provide a patch that exposes that info to the kernel somehow. In the absence of that perhaps one day someone will have the time to sniff USB packets using Qemu to see how it is done and submit a patch.

Hi,

do you know whether anyone has tried talking to Asmedia?

	Regards
		Oliver

