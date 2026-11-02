Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626481;
	b=3jMYvmWEr689DMuNrw7cpESFD6a4TgApDLzKiGkjTq5tXxneqKT2WRuHgNNwmmJCCCLs
	 rBimp2SyWbbvfS6hxwfNq2kSOU7++1/UUO1LXSyvTRH+J40r01CTwgvWYoyrn0tlWrFcy
	 /HpA4zipG1hqgy4CWt0iiArRMPTqhE4lJ8RRm6BtzH6Tnq2vqhB63e5wnAYTLW08HF74H
	 oPZST4wlrZM9gpEQAKKcvHD6v7n1wEuFXX94Dr+7bW6pSSzew+v3VQNkgVTAEkxcoTwm0
	 Y2wpw71BT/LDi5HMQOmNPhaEIHJYIDEDlS2JkRxPVL5eVRafenyGOh0dDkxbyueJaag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6R/u431umGtSkGq0ekXuHtMmDyjJRoaSYLM3qGkDCO4=;
	b=B4Fcv71owfkd8iMa+27VE4UIA2q4w+mR8JVP4aW4537oPeAf3oRDEKJWqT9FftMnXL1w
	 4V1wqAuNqJ+bGBOxlQYgFWd//FY4aijsZI/UgGkEIasg+sABYMjMwHkrCZqU/0m0QSj9U
	 JY/a05P184dcnpJr+cYKlegBckOLNwR5q1Opy0scS16ke+3IAePaK9XXFqj1gda8Rruci
	 RQSSvlBB7vMN4tNycqPjpUwoMB0PkcO5Use46DAjmq7gY6WjbaVcK3udVK+frWMWU3etG
	 i3eyFTXQDjdl/3L39XeRTASfMHGQ5TzWnQelG1wQp8YZMxVs3nKullgYlmTIQkgXQwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vxkCrL7D;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C2C606A331
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 13:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8C2C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vxkCrL7D
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso34932025e9.1
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 05:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793626479; x=1794231279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6R/u431umGtSkGq0ekXuHtMmDyjJRoaSYLM3qGkDCO4=;
        b=vxkCrL7DvCsMFVKdBCQhqjoeH7mIRO46s2nHFM91xUvxoS67ayd64OS225aEifEjTG
         bh8Mvh5N+eeUsjMlf9qorQkDt3mSdacKQfcwrRZf46m40gx7iz0kWYv4I/SEFV4T/kyN
         yavJkGnQ9hwYQXohz7ijamiFdGtmWSA8D+w3pVd3l01M6+3pZEI6PH8KrrWgCCJvc4Ip
         YtvrJ42dOYoBenv1dgf2fEdS+Zqw0BCDOfPa31q6ouwp2yHu25lYCgkesXPJLew6R+TN
         WR0N2QrvfP817RY6/3cDexrO5+7KRVpBemi8NMsJ1TAZFVM6cXybZ/YkIscEk6kKU454
         4cfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626479; x=1794231279;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6R/u431umGtSkGq0ekXuHtMmDyjJRoaSYLM3qGkDCO4=;
        b=fTTBdVNCgE2ESqL604MrJrZf4MQ5gzEWDkxgwVE31yLU942L5XIOD67OqDxYb9AEBR
         NyiV12rT/l4I+Wu2rwMfys+ZzNDQPqzh+ykHUcw+VqS4BmmVfi80OFWrHMHYT0iTqBRZ
         H3/XaOHWSQordeIGmQJRRmnVXDp4YnweOq3HfFsvdQQwpiH9uBUTB+WQfq2EeWnRl4i6
         mL3Sn1FLyrD6R5zAaw4HgrMJgqveb6JVxmkCu8FPviW0cH1BrXHHNXox60iKcRKV9N2M
         t/W39oWxZvQ3j4qNyHrQtajGduDLC/73e8ljrNypOgC7wmueqggvRUFDPvXo+72oizqU
         y2ng==
X-Forwarded-Encrypted: i=1; AKwUvBxqPgnOqdkwtRGBlGy4AWbc73G5IcTmA88KDveRsyCsIiy5SrqpVWDtMzwGOInNWAm712cYZ5A5s1k=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0i74hHC/DayFLk/1FJSBzMWjs7+wdrqP/e+t5zKf+2hutGmBp
	tTFkw8Q82RHzMJogjAOeiSutAfrmOlMmCK+u955aTT3EDJgVndGuCixO
X-Gm-Gg: AYBFou1PSqhbLbhItGYjvkyOXDhvuC+cGEqKnDOSiDUB5cT61fhJXv05c9f9VjaeAPW
	2SjTqN1T/Z8QK3n0fc0D4nIyufdCvKF5jP4ADiC5XAb18+WZPsjQK6O2BRkBoiFove0c2DxnXbY
	16sjHWBtUSr708O+MvnEB4LVDn6O+R0GF02vHh3HksUqWH5xPCN9laHXRivfFgl7V5ViG4SpOWk
	OuUegCK96WkiOM2naadCtAUFdK8fpbT+8IvIa9e7LQWor1LGLj5Z9OQLVxDMAsGNjROk+pOG1l0
	S5AHSdiKNRrAG0/Z3AQkuKDC9vyUVTWiM+PYaEY4KN4oh6ML+S30H2e/nA49q5In9T/4pjv+ao8
	Yj9HNZOVXGNiojecooSGYQb3Ytn5msoOWCtNPsugkMjSlTGiimNgQJag9TW9Hyv7hnu9MGuy5md
	KCJkQ8jeVl18Tr/xRKeU4DwyWRuxtSA9RGKk2qR2/G764XIRxfmejkQBiLZNXQtbIdFdHLUjDFK
	hZfA+O9HgBeWm3ffB88Ks82/wNchcHe1pV7kItbOdUojGphMjPaIePZYziBClJ3HDePDiZV2EXz
	zN2joKKKhJ10RL6PBsV3Y9k8yRkF889pPxrcPNtObjN9SPYP+2n1MjhREA==
X-Received: by 2002:a05:600c:4f55:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4ac182dcba3mr253672315e9.17.1793626479081;
        Mon, 02 Nov 2026 05:34:39 -0800 (PST)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf396dfdbsm274233715e9.1.2026.11.02.05.34.37
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 02 Nov 2026 05:34:38 -0800 (PST)
Date: Mon, 2 Nov 2026 14:34:35 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Jianping Liu <frankljpliu@gmail.com>, gregkh@linuxfoundation.org,
 dakr@kernel.org, shashank.mahadasyam@sony.com, johan@kernel.org,
 hadess@hadess.net, frankjpliu@tencent.com, guanyulin@google.com,
 gary@garyguo.net, rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH] usb: core: raise root-hub autosuspend delay to stop a
 busy-loop
Message-ID: <20261102143435.044064df.michal.pecio@gmail.com>
In-Reply-To: <a35865b5-3779-40a4-9a83-8edd797e56b5@rowland.harvard.edu>
References: <20261028041859.1061836-1-frankljpliu@gmail.com>
	<a35865b5-3779-40a4-9a83-8edd797e56b5@rowland.harvard.edu>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Oct 2026 22:23:02 -0400, Alan Stern wrote:
> On Wed, Oct 28, 2026 at 12:18:59PM +0800, Jianping Liu wrote:
> > From: Jianping Liu <frankjpliu@tencent.com>
> > 
> > hub_probe() sets the hub autosuspend delay to 0. An idle hub is
> > therefore suspended at once, with no waiting time.
> > 
> > Suspending the root hub can fail. While a port reports over-current
> > or a connect change, xHCI refuses the bus suspend and returns
> > -EBUSY. usb_runtime_suspend() returns that error. The hub is
> > resumed, and when its status URB completes the same suspend runs
> > again.

Yes, I have seen this ping-ponging before.

> 
> Why should root hubs be special?  An ordinary hub doesn't refuse to 
> suspend because of an over-current or connect change.  xhci-hcd ought
> to behave the same way.

IDK what happened there, but we have this:

commit e9fb08d617bfae5471d902112667d0eeb9dee3c4
Author: Mathias Nyman <mathias.nyman@linux.intel.com>
Date:   Tue Apr 21 17:08:21 2020 +0300

    xhci: prevent bus suspend if a roothub port detected a over-current condition
    
    Suspending the bus and host controller while a port is in a over-current
    condition may halt the host.
    Also keep the roothub running if over-current is active.
    
    Cc: <stable@vger.kernel.org>
    Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
    Link: https://lore.kernel.org/r/20200421140822.28233-3-mathias.nyman@linux.intel.com
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Regards,
Michal
