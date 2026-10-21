Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576112;
	b=lG42Hpc1D0lx2hTMRW/GGiiA+fkn8Sps104p6LzOwMnAitND1ti8DweZV0T509UiV+O9
	 ixYOlcPzN3wLp7bAxoIFt/ruCCRsl9TspKawl8xm5O9sqwcjporGsvhc/V2koAgL6j/gp
	 6HMXsIB1c4nMnrEb2E2XpANvBmwjWgiuEKaXIo602+7tfSVerlSDjXXjOnbbxWdBvdbPP
	 Av6y+YHw3UEjz0qo7h2e665Ge72LA3+loomE5V9ygLzmLFhrmtiGrUcBZCXFdqD7mnbZu
	 qLg7mwCKPCq39kZPmPrUw9vIZL8oVc1js1SrM/ltiCCi58P0eI+GO8w1vzKpZLxnzUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Mh2Rxs2VVxQVMwcaeQdPl7L+AKjaYhQ5G36WKv9mHbc=;
	b=UROgV7vct2OTWWLrMTq6NHrJwCzuuUpVVqZQmvbSiPiQQ/ZbWo0Hmjy5c8LKUKnDjVML
	 tZuv3lU/KBu7xsOCwcW2wLf2WOamvZNyPcDMk48irpMAv7GLzChZfyFbitybpD5vd6TGo
	 Le+DpyEHjA95tg3q5gglNM2um44wC2Gi3TqQ+YJbmvlfDEsSSILocBmrYN4Pb6llGfjGY
	 g7jsp2JLzFj+TZZNUX9aYRKMF3AIpr24jEnRdheyA7YOw8b0gkC7A8ZzjSTK2JkG78WQU
	 Ie+P4Fsi+exMOmGq99Lblxr3xSsbGQp68oiTprypWoJ4FbzbxMYuvIfS8hoyfuF/eWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VEo7U6w+;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112BF606A31A
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 09:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 112BF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VEo7U6w+
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1dfd49525so4012435e9.0
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 02:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792576110; x=1793180910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mh2Rxs2VVxQVMwcaeQdPl7L+AKjaYhQ5G36WKv9mHbc=;
        b=VEo7U6w+K5lNtp1WixdupNPOgBRrmsCJZ/k02cdV4zC9cyLfz92921MRsKkXmw+MWr
         rCtqk4tfhUTdyXPGVI4woj2+Xak/sxXrc/gMhmhL3k807fVrwG9Dgvs3NywHhC0D2tr3
         PckadojSrN4Xd7hlGQjNmXcw1jTsx1UO4+mEkBSR+Wmb53qnROvJ0HJ9iWG4qPMv23Pm
         LM7qJmw+pQxmsmFvdSDCqDGT6RU1es6gRhz/mJFzzzGSJ7f1HTihf87fUk+3wSapBsVQ
         nQSMZyvXLHwMVXcHzstp8if78ZcxBYzNXPOasVLg0hHiqqBFyFHWH2Q0NNQcJFw6Izci
         mBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576110; x=1793180910;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mh2Rxs2VVxQVMwcaeQdPl7L+AKjaYhQ5G36WKv9mHbc=;
        b=pNmmITOTX4Bu8+7PUzW5R7VxgjnF+64RBZ0AvVM2JffzRdsNCR+uA4Lmdjgd920+je
         lUkGuDSavSAMc01ij3xL/EpTzSOblvr57fRtaLvhy+LFKpHTj6xZrjsIqZ9JbxnJhy0j
         O7eto0MZofzuNrXV3C+wpXH72VFMlnbs06DqJjOCmwe+P8VFGa0r3jQHPvAt5oVKfAAi
         IxD8UAg3T3S0zlgcQYTS35HuAkNGmq9+H3J50QamyToODv8TL9hn1xn0x3monPt9wyqJ
         bQ7rbh1O1wvc08j4xlsgTi4UhsrLLGaorLL23uNJ+jg7wySOMKO4HWT8KLIwWWaux9IB
         OV+A==
X-Forwarded-Encrypted: i=1; AKwUvByyqScI/JREVwLJnCbe6IXhDBUhk16980YpK+ZlLpjDqpJDlIh37JgOqhgmgyCCAX7bzeIrdf/G7hI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAzk9PnW0znd6DaMbMRkayN2MnJG+kKKop5AEWF7ovH7hSRH7+
	l0XJwaOeNbD/c2Kkt8Ay6Cu3ZW47w+UKx0WOrwNvEVoITSgi+ivHHFNn0Dk2WgWwLYw=
X-Gm-Gg: AYBFou1xOoeKr/NlslmtdaOsFWLGOCK8T8Adp6/9r6FNuToWjrUR7h4Rt3lblfjGdxs
	VBl4m8tSL1DJ/nZ/AsSAG+MS7PogTu9KCPIB4RSEVvVjYJ9x4+xMm86MNUtHIolGXVOsHaI3LVN
	p6yiPAqseVhrHJaAxy7guTn0b4gT/8vtK3vjyGDKEQLRIPYuvjiNlYIuqeJAxEK1lPwsML6Z2G/
	m/G/Vg2SeWSi+oaDx+ee4OaTEQ36SBJ1dPHhSnzGBbeu3fR8hBXEuI9rs8b07qLG9U4EclDTjCo
	CyYZHSgNJUdNbw3f6Vi39R3Xy9MyQksFNo31kMCMWxQHMKR2AuRDPsyHbYpxKo/z3ptST13HimR
	zDX67iH0VmJle38EwvUJLIEHimnxoafdKMGr6zU/a8xsYeTw9KkuUNfp6lpuGNwjWd+qESuGbEG
	o+89dkinEXhRXDo1+0Bh+ZR5cJm3LQOW9E+dbOU/Gc3mEz+iwcsC8Ui+Zd3M9Bh74peXF/Vw4sK
	8NPs7ta0Q6o6CcGZggbiZW0kIosQrEaZBzLSH/iWYFwgBlSVV7AmmTZjjnWphfQPUpK+J+mmZ0B
	YOQynkW756KLigD8+OrXpQ==
X-Received: by 2002:a05:600c:4e03:b0:4a1:d492:1604 with SMTP id 5b1f17b1804b1-4a1fdb1d1d2mr30473685e9.11.1792576110418;
        Wed, 21 Oct 2026 02:48:30 -0700 (PDT)
Received: from ?IPV6:2001:a61:1355:5801:38e3:fd59:b268:ce87? ([2001:a61:1355:5801:38e3:fd59:b268:ce87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d85a9bsm157125735e9.15.2026.10.21.02.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:48:30 -0700 (PDT)
Message-ID: <d7475b92-a7c9-4b0d-98dd-37d081cb46ef@suse.com>
Date: Wed, 21 Oct 2026 11:48:28 +0200
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
Subject: Re: [PATCH v2] usb-storage: option_ms: bound probe-time bulk
 transfers
To: Lee Yongjun <jun85566@gmail.com>, stern@rowland.harvard.edu,
 gregkh@linuxfoundation.org
Cc: digidietze@draisberghof.de, xiehongyu1@kylinos.cn,
 linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 syzbot+7317196294d50d6e55c3@syzkaller.appspotmail.com
References: <20261021081616.89976-1-jun85566@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261021081616.89976-1-jun85566@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21.10.26 10:16, Lee Yongjun wrote:

> @@ -112,9 +114,9 @@ static int option_inquiry(struct us_data *us)
>   		result = memcmp(buffer+8, "ZCOPTION", 8);
>   
>   	/* Read the CSW */
> -	usb_stor_bulk_transfer_buf(us,
> -			us->recv_bulk_pipe,
> -			buffer, 13, NULL);
> +	usb_stor_bulk_transfer_buf_timeout(us, us->recv_bulk_pipe,

You have introduced an additional failure mode with giving a timeout.

If you run into the timeout, the device will not work. That means
you can no longer ignore error returns.

	Regards
		Oliver

