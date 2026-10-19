Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792425476;
	b=Wp0WnLff+sqhvw1I96uIepwL9hvtLfYDsG5XKnlinWKxSE4LaNuy/jdc9suTwFj9pIDK
	 7CXVJtagGWnoxRBCLHey+xFo4nCNbxtLjgroqL+esIVSCXb0tQhiGliSeQOXFm2q5xsfE
	 qzLmt+OQYsdJVv1725fly80pJjn7yjGHkqlCIaW0hMwmLj4Uam4dnh/PioE4urnLyR9zV
	 xHlA9wXPo2r6PldyDeSlp+vMEauPpMqKRr2OxxLgTRfHZHm4kAkwCLvZ3FPSIQMlBoODY
	 HzTSymd4V+i7+Qvf9XuzR37BCEv1AKrfibjpohRyWQD303vNXIzIBG79c3HYdjOFVdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792425476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QddLw93EcgmZpHPz0KjEO8kI4gvvUDfvlmz2bX7Jn1M=;
	b=5Cj7HLWObcMWq1PKkwSzg6aUGhT1Y8CVAUkZEwuD+RjjqgyZKjh8L1g4SsQQT+t5AOHa
	 h701m2EWGoqQW+J/NAQhf/QPdcXyTwKxw/hKtXEXqmFEghALXzI04wVXQcoTG5A0ofHaJ
	 KLrh20sOuAewguz9b27SX+0cmAnrJJ51fmkWwl4h6FXASpLDybGxOAHk+NaRS+jrmIFaB
	 AiS7L0Mg1VBBSy0e37rwyxKLzRAt1hWV/IdKmYSi968sXsHEH2ubs4liLjSHoe5F3h6JL
	 3t5Df3q8D/JMLf9NqE95qLqD2MT8cXR8pUVHpbb2mzuj9E9N+kJzjpceM0EePtnraFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VWBB1Mjc;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37829607249D
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 15:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37829607249D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VWBB1Mjc
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1dfd49525so13651905e9.0
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 08:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792425474; x=1793030274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QddLw93EcgmZpHPz0KjEO8kI4gvvUDfvlmz2bX7Jn1M=;
        b=VWBB1MjcXtwiNjV+ttzo5E26QyWt4sGDt6NX3VOKMuBuqN24Fv+acI0yjCGrFXpqww
         6FRJxyT4ogdjFOx79ZeY04BBsZwPXE66DcZ8mJ7BqPc/stgEXuicr+R6Fkfn0ogkuVIz
         QpyrxrrkvEAbJJZVpJgmvCC73VpKfRUFPw+cFmTn8VMl/7TNNd4EP2VQuer078BSRpca
         2UefpkyedSfSjUkcduHbH8JFO+qvBHpPDqbGvAwuDD3P5sRaHYAoHaBzsoNf0YRaOHjm
         7n+Z8tbNHsm/AMmBI1aUI3RGBNloAzP2djhZvvR9MiDDdOkjqqe9AXITLl95oCS7zNOO
         YJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792425474; x=1793030274;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QddLw93EcgmZpHPz0KjEO8kI4gvvUDfvlmz2bX7Jn1M=;
        b=X/bnZPgEuv6LnpL+cddH13SaU7X3JlJB1wK8xhhOQfFB4nuyewfyaODu6GTOlDJCxl
         Xgg1UYUk5392Jix0Ejr66nodXilkJwkKTeq7cAvXf2FwC62pxtevS4mdMccJ3C7FB+n5
         cTRR7o/yVkHHTLHHeGm0lqsm4P+x20AgRZ/XrZCj8CimAqt3+FHKJksKO8TMAwZXoi/B
         XNmhN1CvUa7qGVTn61DJRAljxkfqZ72BTdXaYh8TieboF9fDiUrijmVc2eyzWJSZRaBx
         3MZrsCG57F+nRQHiaVslBEUWTUwaqAk6DsRULEipgCe0EOC7t4Eoi+N20BSdSor+EqaH
         vpDw==
X-Forwarded-Encrypted: i=1; AKwUvBy+AIpzEetVbLsSL/2p+hyCD6d+pje1jXAX7Aw5oYxsNyYLf2B/peBOrPVag4Ko3fQt7NtTLNv8q4c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLp7NOTNpGugCEhQDbyCNR5pYeTm67emqeqZ9OiE8NYiOZKmep/
	c+YrYEBPUN1v3RbnnJFbq//o8wE/uoW0ogNgUH/VuYAOW51fZ3/3Ug65kCEPf1GwFrU=
X-Gm-Gg: AYBFou0zaIASeGPF0Ad9w502cThcFBw4jr+4O9TCFeVxX0Q6V4Rbp/ZII6vVh1WmsLT
	r0DvgI9oiGPwvX0khYeruM0IAAMVR7ht15Qz/KFjabOD+W1mP135oBqSc5EatCsh0ZGLDdcjYDk
	XK8A5r18psptXTLgiBEas38WN5qiDtjz/uNauYLTHCV33iJ4pTbH3qUnFKYTr3F1uNJairBitmn
	i6R+z0ly2yevHwHtugKQqqy5zZQXAKmygMCTavGEQcsRSrHag+vVR/PJKZzBrcCLBZ/m0o9qKfv
	/JIq+vEE4FWMW1nLIph7U+OqAvLFTZpmev99kZu8R/fetcFESTqudcWC95sPLdAH+xMqyzUveM2
	Shd6E00XT5xx6Xj3r/UTmasa2T+mz7fYGatQZA5P5TZu+JVVmFlyXLB50PFzCUV9EBrQVACVmfO
	mpoBfkgcPK33GmuPoUYKRhdVx+CZzuy4H6DNOtNTk27qiajKfFTG9XIDV/QFo3m2EBYaYyDPxsQ
	UAzQLV1pAxGSLueKqnzblpknzSWWMEIhcmqiaBnsP19KsEW
X-Received: by 2002:a05:600c:4f42:b0:4a1:ddca:8b66 with SMTP id 5b1f17b1804b1-4a1ddca9066mr177962265e9.31.1792425474431;
        Mon, 19 Oct 2026 08:57:54 -0700 (PDT)
Received: from ?IPV6:2001:a61:133e:801:c51c:5fb5:963a:e830? ([2001:a61:133e:801:c51c:5fb5:963a:e830])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7ff1sm25799936f8f.25.2026.10.19.08.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 08:57:52 -0700 (PDT)
Message-ID: <bc5f5d7e-5190-4bc6-a608-db1b74062679@suse.com>
Date: Mon, 19 Oct 2026 17:57:50 +0200
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
Subject: Re: [usb-storage] [PATCH] usb: storage: bound timeout=0 URB waits to
 30s
To: Hongyu Xie <xiehongyu1@kylinos.cn>, Alan Stern <stern@rowland.harvard.edu>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net
References: <20261014093856.415812-1-xiehongyu1@kylinos.cn>
 <c1a82ee2-c48a-44ca-9da7-d3bad26dc240@rowland.harvard.edu>
 <179213233444.78616.16846009709382132836@kylinos.cn>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <179213233444.78616.16846009709382132836@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16.10.26 08:32, Hongyu Xie wrote:
> No command would be limited below -- or beyond -- what the SCSI layer
> already grants it. The flat fallback would remain only for the
> command-less internal transfers (the probe-time CBW/CSW/CBI exchanges
> and similar), which today have no deadline of any kind. In the
> September incidents the offending command was an events-poll TUR with
> a 30s deadline, so behavior there is identical either way.

Hi,

I would very much appreciate if we could separate this issue.
If there are commands issued on the bus without a corresponding
SCSI request, then we do need a timeout.

That is not the same issue as imposing a timeout for SCSI
requests.

	Regards
		Oliver


