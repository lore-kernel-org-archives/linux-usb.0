Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793177298;
	b=VpXW7YYl7+VdD7GMdtbvLtIy1EIGnZ0Ah58+YGqeAgfpl/7MVry4xwDhtplQLZnuG3TG
	 E8cKNObXxPUXwb2ioF9rbheIN7DAyFp9877HVOyio0M7uzUuAcM6WFf5UVFq47KGom1lx
	 0s1uKrJYdnwP6NdUCBC2eoJkKKY4E3Lob5GxQedkdqTZRmMHwJOSmHVuEBcCuXslHCPWQ
	 vzVsjqhskbiHs7tw4DF+FK+HXitSeaWlC6o6qiCSLJwH/geSB+Q7A94SjWCKSl/jEqH4D
	 ORCTab6c1raL3fCRGFUZ6s6E08oib4coPQIkz0Q/XOJ/Fdhfkx/SmXm0N5A60t/sj1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793177298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/P4FiXSfTahRag+IvS76kiNUJNsGZXNeZs1soro+q0U=;
	b=f1IA3BVtBYnr429e/eP5+rh/Oi73h4Xqy6Fbuj7TRjaBXVuQqjMigKPohC2tuJxr1L8g
	 i+1RHDGM2OVPl+cwHsl47+oym0S146Xb9UeKUTPxfNo4HjyzahoYze2Dbn/m2VUOhJRT0
	 SOKYYjL1BY3IBSOYk2L0iI4Hpz1zguuv5H0QykojTw9fOibomP7oIP3MSWLG32Edc6xNn
	 UpFpjEMKUcjMY8fjK4vNN23gUFASnFgsBcyeDGrqwGQVNq38LLMdQk3WeW/bms12rrG2F
	 MAba1gt9lUbk0OBQShoT/zT9TZiu55m92PtEyHKUhcKml/+paKHhGANebuXB7ffWkAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=D98NASGz;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128BE606A31E
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 08:48:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 128BE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=D98NASGz
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so10176085e9.0
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 01:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793177296; x=1793782096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/P4FiXSfTahRag+IvS76kiNUJNsGZXNeZs1soro+q0U=;
        b=D98NASGz48p7nzkolCFiBv4ijS+AKWuUcJww6ATbM972WUm4X5vRZV7iNzb9SIxKyx
         gFC7a4SjHboCVyZlMEQewuvtX9pBbZJ8HQXd/YRps3XtTbGtkp5xlpIMBKURowHrhJsU
         EhDFxa4FvXAYYT07wlt2TAHY3/eO5IlCs1/zrnH5D+KNjaDT10CkZerq/B085TALGqGQ
         WfM4VhyXuV4oFa/7BOzbL/T+qAV81zbphPF5Sw14di0J5Qz//ji+Fl3yzluw7lPLV3Fb
         aOGI4xsBxHqcn7jKTp8hUtcafadwY4BQSUp2z7uZgYIjKohp8dq14HCzQrmSmCH7JchF
         A4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793177296; x=1793782096;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/P4FiXSfTahRag+IvS76kiNUJNsGZXNeZs1soro+q0U=;
        b=1K38VK7cvCn7YxS9LwZoE43MfoWuiJ1v1nLUZotm6C2r3UXG9PT16C9dTICjSdD3wE
         f5d55wfdXNH5YfKAejUawahk6bM6Wswpuw1jYzfle+te9vBGkdwbwlBwOOe9ZFHnNz/c
         QjElIyY0T6jXHEZD0TELAKrcKhd9fs8RigJrj7IOSmtOMPGyQJRhi8cmBUmh0GRS0ZNe
         w4JF0+hrTDlpo+Pb00QmkFRM0tZr6C8VhzdWKAJzmNrFb5fituRlDTYjThGHCenAjREo
         KmdCtGz3aEcoDb2HC9Uy1bwH26UDe+9DDxADHkfY15btxd2nSx/jkK3OlF3NdHZAZSd0
         l8XA==
X-Forwarded-Encrypted: i=1; AKwUvBzVKwqvyqQY0/OyEapDA6S8DDlRtqw/ftaKjte4qLSlVY0Lzzkt4K1HTT5ULL2PfYLg3HRjv2zH9tA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpNY/0qLKRDH8nNBT/l7Pe/VrMClj7CE9nyP5cWPAj9uhYoy+c
	Ml7C7ER7QDraARoHIsdhctCgFmrZgvCWHlMLMEfKrk/SLIA55aP2mklB7k8xcSmKclA=
X-Gm-Gg: AYBFou06SGmK7g0KibpIjdRJMxUD7Wah/MwMGV49KLnFiL8WLHUe7B1Z+qNnpeDXX8Z
	qSXwO8nvZYPzZvqFVBphNdrIMUWmpeBqrCKJ1trWJMiKf7Ka+j3ykb6BeRzWoZfWmxJp10J918o
	nmQaKHyIrraByoOlVgFssVlEx34LMIbS8ot7u7PEOdUHR2MiTIk730pqTAYwT6NR/iciOa+1X5P
	P7KvvX17o4fJU+0liYpCtdloEhVE7i8AQJJiLAyftuoaAzU91n8DC/DZV+lD1q5HrmGneaaaxY/
	eaVXf5yDy61yPdprnV08gkylq7qFennisu8rpMPNL0PptKNh307hJHTD4X+GvD6opJlS1qzoDe/
	ggbEiO5h4m3sr73e3xhED2P4AvTt8NiweBjfrg16EcXCjDtPwgtdo3plaSVBHxQPu9TAUu/RaVI
	MmXz/S1uIBy32SNcvOnNybNJhGIw+FWM+fysw89ccpFOsooTIQ5qU8n3upUySeyqP0ntvd9z/xs
	5g5c2kpnpNQBWS27st1DzIt99kjf3yd1TFVPPPfbu52+/e+BvFehPR45WPoms87J/GnI4owzjo0
	fyEAmJYeW1CE5Cj8Qsk52vxGxSh8xNHMdQUTZELIn2g6gPipLm9yvwJ8T8IeWmLd7FXW
X-Received: by 2002:a05:600c:a00f:b0:4a1:9c71:9f17 with SMTP id 5b1f17b1804b1-4a996d873a9mr22922355e9.9.1793177296320;
        Wed, 28 Oct 2026 01:48:16 -0700 (PDT)
Received: from ?IPV6:2001:a61:13b5:e001:5d05:908:ac82:a3a1? ([2001:a61:13b5:e001:5d05:908:ac82:a3a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a93103e72dsm25003415e9.2.2026.10.28.01.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 01:48:15 -0700 (PDT)
Message-ID: <5230664a-9666-4196-a798-260da5aa8e8e@suse.com>
Date: Wed, 28 Oct 2026 09:48:15 +0100
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
Subject: Re: [PATCH v3] usb: uas: wait for pending commands before unbinding
To: Jiayi Li <lijiayi@kylinos.cn>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Michal Pecio <michal.pecio@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org
References: <8469d5fa-2f4e-4565-8d84-43d6b71b4a9c@suse.com>
 <20261028020958.1141513-1-lijiayi@kylinos.cn>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261028020958.1141513-1-lijiayi@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28.10.26 03:09, Jiayi Li wrote:

Hi,

> USB core has already terminated the interface URBs, but a running
> synchronous scan may still be waiting for SCSI command completion.
> Waiting for scan_work at the beginning of uas_disconnect() would
> therefore delay the command cleanup below.

Why? What is it waiting for? And why do you think we can skip
that wait safely?

	Regards
		Oliver

