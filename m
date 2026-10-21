Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569690;
	b=dt4V4ly5+UdjskIRUqWiy7k2u/JfB2/kfqhPOIjT3NSDzc74Vh82K9gybMiyI3dKxnw3
	 ekCCcFfGmBZdCAeRjbI8eFKaazE1RBgXt5XX0Iz0f6vMIZMHTu5tMr27XV+KkjKWXjVFl
	 0Qka2UcyRdelSNZAqG9Dt0pPYSmNAI5ZLlLRM3S+0pW0efyGNwAihFCirfexIGqw4VL7P
	 vx9NulTS/e5jXxCJClzi0zEaoAAz3fRnEPksJWR0wTK/exiOSQ+1DPU0Zfk9Jv0G5NUJw
	 tZIaNwKHurqvudv1MLldTEe55c4ax1+a9j3QepdSAkaqk/sBwVtQsp+aCXWOwfSpH9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8JsivEzCfsBUsKB7VniSyajrogrywUv+aAjVG1xwA/k=;
	b=G1B+UnBXCAglmprn5ERLFNM8k5ibpMLIlEpl2+PRxJxcx2SAfxMx7c3EgtE+MNZgjjq5
	 KQy1FVCPBhmnJfywtL8UGWdg1MnguIfshbCl23yZ9HsAQvx/PNRUoSRB2BKJek6ylP5Hs
	 DRKti0Lz28wus2BwRWDCH4y9Bg6pkabKu2H0MArQ9mdtdYfs54GRuNJGoidvl27z7D9XA
	 WdBKimwKDqIjAXcPMeLCRHq73s2uFfLfckMa+3V4k7SKDv+cSPf87bmnS3FENzbnApMfM
	 yZ/dpzGX1ZEuc5WU7dtgVtt76NAn5aJ6JZOo1quTBbKE0LQJzzTvj/T2o4sw9/KHgag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PNQ8gbLw;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB15D606A319
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 08:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB15D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PNQ8gbLw
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so374039f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 01:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792569688; x=1793174488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8JsivEzCfsBUsKB7VniSyajrogrywUv+aAjVG1xwA/k=;
        b=PNQ8gbLwhnN3xwijAEbY/MjJSOHfENlfsgK0sFWXmepdRB8kYoa9HWXzPjsMpOhvED
         VDrA3wiG0qOAFhoB2xbc7WhJQvPnfxbf+evFAsf4S9myLySRFtcIpfJlgN1U73OlEwir
         8Jn0IDENmxCNMB/M1o/HkAH7nPEDz5s1y2PT6x0q3C6gIxpCVks01c4GKW13Y+TONoRe
         BWrN0zg87NHSuzMHuHLDVkhBGTUuGykI6q5sHCJT/QBtHEw+qzWElqUpLFgMSOY7WFGc
         Cl7/k6id3HxKUn0tl11J8ImyvuwyXWFu7dsm5BRCyR9W5pNu722sAyWeWnvlZcYlSj+s
         HtcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569688; x=1793174488;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8JsivEzCfsBUsKB7VniSyajrogrywUv+aAjVG1xwA/k=;
        b=rv5BWfE0aomVtxx2ucXXpxVJftBy3d0dewP5G1f8wSJFsyJzZkdH7dadfCTcQ7DF9M
         hjNtjR+Nx3TMFy0Ssfj5OpGxR1kXfZbu1A375P7Mj8l8TRRugNcFrdWDhGk9Vox8U+RL
         asNZwM7/7VVj0evgtqPsVY/GS3Q77rzgpmK/TQPFX3hxcVbBkUhFHuErWCoYQtdGrRWH
         tLcchnxlEUSrxXBK7nD77cYMorI7yBitrI71Bk6gDtNu4u12bYyEl7PKpBKx5CHSxSJ/
         dT0cwK1Omo8hMkWgb+9ez0uwOAi0+qBg8XBmDHoPIYgr93YrF5zwJZ9RxqA12Qjn9d8y
         zUFA==
X-Forwarded-Encrypted: i=1; AKwUvByVHhSNNZcN0U5kXAFyh2MQMcBAnE/O9Rv86MNS4RD5l4ssu5+++AP9fmsbBqrQZK5x/WrY4dV9UeA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLQhfDBp0eg8ULq1GJtO/uv18ERhies0q8RJ+NSestabdyubXU
	pSgQ2YrPXFW6i4X79JfVmOL0o1rDsqD/yyuN2hXdKxCaJBFC3Mw/SITr8yRfHmbWRCc=
X-Gm-Gg: AYBFou0Cw3AHZUxl4puWK9fUtId2+TirfoWtuh9bYvZO7XYYRjUW6dIwxStXTNbV8E6
	wDGaKd1jDNFQva1fWQUOjiFjYVnLakMToDvPH53rsue38zwcTpHxV6tfm9caukOISMav0O5UCqA
	Zw/1EAVAOEdWNQ/pnipu0NC3r7Dzp325BChscznPGFlH7Yh5+IsA7Z1dBiqZ7AzpWQg/hcTvLRU
	cWIL0OTfS1HtqWAtTykoji3yKQPdzOWkP06JJVU5d3pa9GPEuKHvqAeWILqZ9q++Zkx9hZPr2jQ
	dWS53c7wm/kWcV8XZe6HDYKWOYv8RhDYwN1T3wwT+ULmlKX8GdP6xV8Hxig9eacdQI9g6c+qqE/
	gOulJlV+4NeUzol+uQyPzFAye9tiBCZ/7BrLMGlzxKjft7zB4qdyjhTXCR9urJlSRHnsYKJDcUa
	joP2ztSg6BAn4MPNYhFBWgdOEYY/7l8/1fiF4s438N7bZAZYMOKtWv5CDwj8ClSjZKc6Ka1u3WF
	Rj38YsGlKUG6aZiWo7eC6l2O9oCHsN9BJOSMX+jKf2Hov4mKjK8DxRWMvmG02hSLylk1V1wnYZW
	Jq/NC6v3Ldro+HUT2w==
X-Received: by 2002:a5d:5f42:0:b0:48d:f996:1814 with SMTP id ffacd0b85a97d-48e264fb916mr2431823f8f.57.1792569686595;
        Wed, 21 Oct 2026 01:01:26 -0700 (PDT)
Received: from ?IPV6:2a02:3033:701:244:19c9:79b9:fe6b:6f9? ([2a02:3033:701:244:19c9:79b9:fe6b:6f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2582a53fsm3980308f8f.32.2026.10.21.01.01.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:01:25 -0700 (PDT)
Message-ID: <f86ca4e0-b294-42cb-b51a-d9e9984544ef@suse.com>
Date: Wed, 21 Oct 2026 10:01:24 +0200
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
Subject: Re: [PATCH] usb: core: Emit KOBJ_CHANGE on unbound interface
To: Fabien Sanglard <sanglardf@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <b7c2f7d1-40fd-4d83-8ced-5fc27e3be051@rowland.harvard.edu>
 <20261012171609.88273-1-sanglardf@google.com>
 <b819ff38-6916-40e0-b2f3-1b19876971bd@suse.com>
 <CAA92w6=OhNYXF_kQFV4tPKa19xdWRkdQbFXaqhdxfqW4N9zMVg@mail.gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <CAA92w6=OhNYXF_kQFV4tPKa19xdWRkdQbFXaqhdxfqW4N9zMVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Good morning,

On 13.10.26 18:48, Fabien Sanglard wrote:

> That said, unifying the behavior upon reset would be elegant. My main
> concern is whether some existing udev rules or netlink listeners in
> user space might break if we generalize this behavior and start
> emitting unexpected CHANGE events for interfaces that successfully
> rebound (which already emit UNBIND -> BIND).

On a generic note, it seems to me that you are concerned about
an unavoidable case. You can check whether an interface is
unclaimed. Yet you have no way to ensure that the result of
your check is still current and thus valid, at time you act
upon it.

In other words, you were about to design an interface that is
inherently racy. That is not a good idea.
If you really, really need to avoid it, you'd have to define
a new type of event.

	Regards
		Oliver

