Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841D94A1E0E
	for <linux-usb@vger.kernel.org>; Tue,  8 Sep 2026 09:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859423; cv=none; b=hSlHJwm0+FpB9hJTLctRHt8B7Y3GyLrY+7p1rzbAg286x23xI7juJ4JHgf39izmiOYsc33krIVZPQcinanHYJHi+JHYwSL6Jy7Q42ar+uRQlqgweyDaDBPNSlNyUD2IYbj9NifHIf4U2Cd9p+iGkXIKy/dI9SzWWVBYNtx+SOHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859423; c=relaxed/simple;
	bh=kMsKP9Zq4Gaj8w4igYhLQ64+EUrP9uQlyEov5FkmmpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u2OjcmmYxTpbb3TW0VkWXyHG54yuudP8ZK2DW9JPGddK7t3nAnERtUsmqddK5KB4LoZ/2x846yiCEVXFB8ydFZO3/ggZxt7Rkz/EqLc+aUCDcX+42ezhkdKnqpscKH5n8S4jH+5q+YTz9FGYIts5lLgLVxZ54DWAGJ+PpPhAts0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BMyEb1Ty; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BMyEb1Ty"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49d0b98d6d0so24248865e9.0
        for <linux-usb@vger.kernel.org>; Tue, 08 Sep 2026 02:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788859420; x=1789464220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tTTXXFxmC/zY8DY0xcOtABX4mbvLrd6CKNAWGvfCHrU=;
        b=BMyEb1TyLOlv0qKdI7DW1ZbmuAfEMOUJipgT+60Vq4ZkZSbVM/RigNMYxA9VycHdh6
         ZwZKqwaHenpHl2NzOhQBcLFRsBkZmBhAQ0JrUQ0OdF4NiCUmHzwa8fMyyNZOdWan01qT
         6HYbjOzfQVX6q/szM45HFeTPvuS92Omdmu3u5XD6vT62BTcTRFGioF6ni2uPnB8z3kz3
         9buPGLvw4OETWIZtkl69IhD7fbhAO+vBATGhTOLMZXJInvZOqXY+0AWRRbT5ssZNlnOk
         ul4AfwWkYvK4EADs2GSS+VIbuSLGcFLSUQ8B3hv84MCLQQbgBHymzpgZn5IpRCk5djxA
         Bepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859420; x=1789464220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tTTXXFxmC/zY8DY0xcOtABX4mbvLrd6CKNAWGvfCHrU=;
        b=TmCqVwV3LsfAR7bsMwYIznopsmW1P3GslW/RUzDa7x6xjFUjp9JMB1XBZgCiDge7U3
         vpKA9BxSbZNxxRpkWMEDZDxeGGG7qqJq++oANYCt/FDnqrJkXxR9AoQw9GEIqBxokwGW
         vLz2reVLknDljZ3CSIkUefapfkdoPM7lWJPN+OlPjpHRyQ6tr7keaR75aWo4QYMHn0gE
         k92Ct2ozKwV1VKlhJP5kE64+1Do4SIegOno58oKFVIsPgr5oGM3qGNzVjG4R5MlGuqXy
         WI6wpsqSJLnMc/kdNVvpaiD9Z3cohx/s9xfdrXgW98U+s/fiF8wOOb8My65Q8SV2mXHl
         dEKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLcVEqnsSHadYyxzh5D3mHla7UJSA9dPFKMTSFM+zftQ1+3yNy559bqR+/rQdXdDqVmzaITba1Sq0=@vger.kernel.org
X-Gm-Message-State: AFuF++lE+myVo4kahTjdWspZblBHbKAVRUCoZ+UW3T5mpAUDWljD3oO6
	I/AGpP6BzwP5vL6bkIc3dI6vN1zSsYTCptjjvqceNkthrPWUaf2V66657XagHbpQiJI=
X-Gm-Gg: AYBFou3ce5zZ66ys02HWpZDV9ix75+A435EAVGyFYyu/9Zl2Oc0uWqLFQn6BT8THCKI
	+ysw4G43YILmeLuKWJUfRq1CyrylDlLRvhDJxVzCRUfAmc58lnIQ4DMcIr80Y7ngPwztRtbeU8y
	9a/qqVmqNd5eFnABdH4nfOCAPV/8jyKhYqNeE4ZIh8IhdQnHPIUOllTJG99I6sOnTVJnY/hAS5D
	bry/lwyboUF6Lawrm3GlAQLrSfhghhSt+EsH8c8m5DfITe3u1JnPFvFyyk7ExWaHT3irKzO1p1S
	exd2DIJs6PDEDmhUkcqkxquJaWA9H4UT6AYmEhkh2vdeap1mXQxPED63R9O+hrinKh4HPJ2w+A3
	Vau/m4eJZXuo9OK9LDciFv1yidZ/kMjOw5fvLBCtBf9F5eAb5iXQJscTj2Zsd2lmdnQ/5x7SEo9
	lOsRsxApNg1SVmfs7hnh8nwuTgLZzHfmVi0O9ZWTYdSrm4sKVeI0tlUSGjyYEGPYWr1KNffWruh
	OdYLgNuGDKbWgvDCSJfuw4Htkoi
X-Received: by 2002:a05:600c:3b18:b0:49c:fa21:1c8a with SMTP id 5b1f17b1804b1-49cfa211d97mr230164885e9.31.1788859419699;
        Tue, 08 Sep 2026 02:23:39 -0700 (PDT)
Received: from ?IPV6:2001:a61:134a:e01:4312:e944:2d81:13bd? ([2001:a61:134a:e01:4312:e944:2d81:13bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d04fe7f9dsm279321165e9.0.2026.09.08.02.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:23:39 -0700 (PDT)
Message-ID: <871c61a0-3834-4d58-a69b-96ddd3593873@suse.com>
Date: Tue, 8 Sep 2026 11:23:38 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: cdc-acm: fix racy TIOCMIWAIT implementation
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260907065501.101013-1-johan@kernel.org>
 <e231a7e9-7aa9-40ea-8ac6-57855b4ac811@suse.com>
 <ap56NTVMq8GlbjmR@hovoldconsulting.com>
 <72615ee3-46eb-4639-a408-ba29c1235d08@suse.com>
 <ap6LcHWDvIWF3oNK@hovoldconsulting.com>
 <bc055887-3029-4740-bec5-7e2fe4205992@suse.com>
 <ap6iJ6vkVIaxXFwn@hovoldconsulting.com>
 <f642f815-df4f-473b-aaa2-89153c08bc05@suse.com>
 <ap62IbbQti28M_SA@hovoldconsulting.com>
 <a9db0fce-2a2d-4896-a3c3-2afff4080168@suse.com>
 <ap-1YzIoyYsH_3V-@hovoldconsulting.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <ap-1YzIoyYsH_3V-@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08.09.26 09:12, Johan Hovold wrote:
> On Tue, Sep 08, 2026 at 08:54:36AM +0200, Oliver Neukum wrote:
>>
>>

>> Very well. Ample reasons. Do you have a patch or do you want me to fix it?
> 
> I sent a v2 yesterday that should take care of it all:
> 
> 	https://lore.kernel.org/all/20260907095130.130636-1-johan@kernel.org/

Thank you. I misinterpreted your intent. Sorry.

I am afraid that patch has a few weaknesses.

1. It mixes changes to measuring the old count and to how the sleeping works
2. If you want to change the logic at all, then we have a first check for changes
that is almost sure to fail.

It seems to me that if you are going to touch the logic there at all, the
sensible order of actions in the loop would be

A - check for signals
B - schedule
C - check for changes

That way we

i   - avoid calling into the scheduler if signals are pending
ii  - avoid returning -ERESTARTSYS if we have a result we can report
iii - avoid rechecking for changes after only a few dozen cycles
We have an inherent race against the hardware. The chance that we don't
have to sleep is essentially zero.

	Regards
		Oliver


