Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795743012;
	b=g/IGEcvg327rT3PZ7bLJi8mmJyZTqKBZ85O2xWNMxVbv0NyWMPD5dhq5n5EgLs/2mKv4
	 RMXyLzGPMDzZafs3Vrl1fz2WAEA1f0tt3kYyRJvc7LX7PTW0L5z964dnOdEujR8Uxrqh7
	 Wx5pKnFMNZjAUIUeULo2+rWBFUhZFclhUv+SJhX7X6jZXkn0ILOtp6TlZfAHQLttMx2Gd
	 ejZ/izVsJ2qHhfwp4P/RR6nPxW3mrr23AVBdyNAH3QjB1xuGhscJSHOli2vMO9PtzqeSN
	 HYXK2uFRp1eZbbjB3yizoILx3xwxFDLxxol3vrDW+xTYub2Kvlxl6xxRkMb53ySt6Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795743012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=3WmyiL6hLBXLpshzprl47BB5b7vCbWHukhD29ygZnKE=;
	b=t0IpPDqbBFLXG9q8b2Jkg4AzsU8OpWqEuMTtMBz7HeEEWsE7p4QP3Pci4W3jpksHjM1+
	 jhQ2Ey/XLRM4vWKnj9elC8mQr36pxeYLxVkyhCPJfC8Bvl439xEIbgM3kJaKgNhfhRm1b
	 R5wtEPWRM24Bkba01BoC3Mw0GhriqxKsGo+LvwYDSu+r02mFsQXtMd1psbVp3/mlEBtwi
	 A+2b2ALqu7iDjP+/TK9HILiCYTg2BuBwsnejgCueczHF/87jDm22n9hxHNSg1/oRCUzkv
	 KXbSuiq5MDDu09KbGi3PtHXhntXzpfUJTFupG4uBZaABVli8x1ZI70spUP27jGazi3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ptv9sqiL;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D974606A324
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 01:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D974606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ptv9sqiL
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so5443871b3a.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 17:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795743011; x=1796347811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3WmyiL6hLBXLpshzprl47BB5b7vCbWHukhD29ygZnKE=;
        b=ptv9sqiLLNcVkw/ReeBviRCpnEzRQxZOXIhyLn46idjO1fLUYz9B8gTC484jHpNXn4
         0Ns42z33/amcYM4LvbjTB6AroaNQbRv7GvYJ9kaaNNkGXBuiJCdNh39uxetVqiX1I/Gy
         mFjw3K2hEpTzsgRVSajwJ/7Ouo/rxO6lUGyS8Jv8gwiXBb0aTTLhCs73nHczssepesWo
         s4qxhf2usNhUBAARB+LXMIonbwEO6ZSdKoyrqnFnGPaZGjyAhGkq/usa39honVuhG1hG
         sp1WgwRgLmBGChSI3nNbgWJBh3bOCIdfw6krYpo8ndJb3VEdnCv5/aEQ6FBMJHySrQQC
         IttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795743011; x=1796347811;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3WmyiL6hLBXLpshzprl47BB5b7vCbWHukhD29ygZnKE=;
        b=LM0G+eK8C3QbNoqrleI2w3q876Qe8R6J1bKAP/ufAC/ZUMuMrWuhjzF0Yb3MEpW2aY
         7CgNsWCh6LVeMq0y5gSEN9ARLCnme1o3B/TLaY0Jd1/6mJuMY6zdK3oUhQ6ehWfPze4J
         4AbaiAaus8gqFt+rB+Kn72HCJ0zMfWFS68j5f6jmuKuTmfH0emaNCS1NtOk67uPv23Iy
         QkfJxlQUOl0Wu7idSaM6v6dqYCQsUVKo8uhbZYpfVqSeVWONQE2pID8Tz2GNgGNCpA3s
         7Vki6c+mvS8qDrsOUKsUCVH3qD8oUnpEn/W/Kn3Glj9Q8p8r4roGZNF0IbnuZBkhtVfN
         J0NA==
X-Forwarded-Encrypted: i=1; AL+hErEDbqni6jrWt5l8imjyHubX0+pNtWoU88PEn2Mosq/vMfW37mJ/nJBgA2SUdqMMsJV0YR/6Jd6xKmw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DSwV2fz60SD8KeWfzvUkFI5arjTjMKUg68Ad5LCe4FYkPTdN3
	V9HuFMWTcrvL6GKk8h7kOuOzJLLAU/LRBdmMjYhqplmm+zcUqkKJ4B50QjTbhw==
X-Gm-Gg: AZFdTZcESLtlKo/OAvVVzYBqy4LofJ3cBlfHVpa82yJ0VeeQ9MsEB8HizVS0y2KCYY4
	015hmelS8lOg5BnzwAD2AWPe7c08qI3ZmCkyNJJCGxkQvtRzVhK0SxuoF5c+mFDZPGv2h/X4KnM
	7mqNFFV7wgtMOFGPa/CzzriwfJysDNdMAKVVi5vXmOWDiR2zQjoafqXUWwEJ/GVdzBQ0nMU4S62
	9JWeU6G/9CJn27NXx2rlZuDspQaBjLSXaFCPSppXhQkMINsn0sjHY7iTMG7/IFXxcVfDOTYptrG
	L+MgUlmxhUXAaAf4bRLaitCUf4+1vjs6DJzxCz4M2F85Twah6GcxafZCgNDxwpBm+5xcO9gTV8T
	BJwYChfGf9x6PRNQJyAvdUmkkMlSTGcv0cRcfJ7Uf+t7IfCIpOf7nSn1EQisJGBlLWwjzOYE+M6
	dxZdh9PrazgLrzNJfKKmP6S6AhigN3+jcepJSVi45ZjUQLGDmCopsVN8gmjyBPDWMU92qvahoFz
	4lFf0PQnwImbELKSw7yRE6ycfhxXcAMtObdzvG8ggfLihFAenMHkd1FG7dllgbXFgKojGDB1uU4
	xKPeZlIAzwlDb5KEUHtCTHYmvdDFQJpUsLlzwgHOv5DIPWct05eOJo9UxnN7RtOOgD08jB2slSH
	UTazv5zpI3RU4
X-Received: by 2002:a05:6a00:14cd:b0:876:194e:b8fe with SMTP id d2e1a72fcca58-8c87c388506mr19125098b3a.26.1795743010878;
        Thu, 26 Nov 2026 17:30:10 -0800 (PST)
Received: from [192.168.0.100] (122-117-151-175.hinet-ip.hinet.net. [122.117.151.175])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45756sm11587417b3a.27.2026.11.26.17.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 17:30:10 -0800 (PST)
Message-ID: <cbcc32a8-0f69-4db3-aa3a-ef62aabed05d@gmail.com>
Date: Fri, 27 Nov 2026 09:30:09 +0800
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
Subject: Re: [PATCH RESEND] xhci: Handle missing USB2 resume events on Etron
 hosts
To: Alan Stern <stern@rowland.harvard.edu>,
 Michal Pecio <michal.pecio@gmail.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261123072320.5967-1-ki.chiang65@gmail.com>
 <20261123122343.6d3f8866.michal.pecio@gmail.com>
 <CAHN5xi2dFo2NFbMb8t_5uugX56Fq2=Jj3G2_5xA0-b_NTjQsSg@mail.gmail.com>
 <20261125120545.76f07ed8.michal.pecio@gmail.com>
 <c5649772-9fb3-4644-a08b-bb165f0173ef@rowland.harvard.edu>
Content-Language: en-US
From: Kuangyi Chiang <ki.chiang65@gmail.com>
In-Reply-To: <c5649772-9fb3-4644-a08b-bb165f0173ef@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Michal and Alan,

Alan Stern 於 2026/11/25 下午 10:29 寫道:
> On Wed, Nov 25, 2026 at 12:05:45PM +0100, Michal Pecio wrote:
>> On Wed, 25 Nov 2026 09:33:38 +0800, Kuangyi Chiang wrote:
>> [...]
>>
>> But now, if I disable root hub autosuspend (echo on > power/control),
>> connect two devices which use autosuspend and remote wake one device,
>> the RH wakes both ports and only generates one Port Status Change. It
>> seems nobody expects the other port to be affected so it stays stuck
>> in the Resume state (SW is responsible for transition to U0).
>>
>> I don't see similar behavior in other xHCI root hubs, nor in a few
>> external hubs. Anyone knows if this violates the USB2 spec?
> Yes, it does.
Thanks Michal for reproducing the issue, and Alan for confirming that
this behavior violates the USB2 spec.

I'll verify the repro steps again on both EJ168 and EJ188 with root hub
autosuspend disabled and update the commit message in the next version.

Regards,
Kuangyi
