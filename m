Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568941;
	b=Ay+s0Hk4PhAGTJgXfXB1wE05XMZl3dLkpWohf4UBePJ8fD5tVYMi3pXPsxmggnTHn/bz
	 gTMp9affOYphmcVTVaeGKeBGd4QrmE7JcwkF5bMW5l2BfxqGB/r1znzac2Q3EquyFwjLw
	 POr5y2msbaUo0KFXtgyDp/YpHz0wCftjtaQkIBBLUWA9iyTlWazEFXCIy8rQ6MBJrdO5G
	 YIkQci36RfbXzQAfX9iGFBBkXwYwUfvrSdrjBLmYJtEapRwKA67OLH44qjmBnJLFusb0F
	 yS2gaZiRKLn1+KQr3AXj8oI/z+oVaSEj8KlWasgiPxHNIzkSOzCF3J1V6pGNwueKPGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dQaQFQyFMz3WaHz5uSFzXHRyL9HwryG8dy7Xw+d+Rd4=;
	b=GG4CwwnQLDqEmIJdee+ECUrZQohnE0l0W7Io8o/y1Cr57Mog3sb7cJRL61D+LnGbMjRg
	 qjrUXztzfjLPZEfywTe6o6620se1r3NGb+sVbTaoLKiYXBxcJIXBMt0LNbJUsodciz/uA
	 TULmIjI4BgKt4NleI9cm6vfMVlZp8tKM7KxC11BdzQzW77X+P8MfzDRtM5BF/VGX+3a0T
	 oamiyfrxT30CokkTHN3xiEjxBIgUl0XviVxIuddK/6mffA+xOr3ULdqWY4cK3UesjYPyF
	 Dyo8oAhDisZC+igxalX+ddikj9FA6fQlddy3r6H7P/imWT7Hjyl4lS22tFpNYD+TK3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LQrJ75jR;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E868606A31A
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 07:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E868606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LQrJ75jR
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-487049569b6so228933f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 00:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792568939; x=1793173739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dQaQFQyFMz3WaHz5uSFzXHRyL9HwryG8dy7Xw+d+Rd4=;
        b=LQrJ75jRUyhDNmANUEk7pqQFc984aSgFhSuZ5l7OdiDz/MJFL5Ufj7B9Y2xQnxayyj
         msAZgg8/xzSa8FAgSKwgiGkob/EMEToDD5CAq/P9ZuFchSUQbo97AOUA7ZLHpZY3Wshz
         4iSXggyacwHIAhquzFsRP5ZMKWqdaGccHDlijNqWPIRXDb6T4ZWwITaw6023A0NnIL32
         +yqctfXQXdi7y35zZNBl8k/7OsuXvgOvqJS1xh8FLqWSBX1QRtobFKpUEMkTYFkbiORN
         PVQOeWDmWPp7Nzb3V6SbyfBjQBjgjdSX3VGMz9rX44qQyt2tWEaUyhYcQrpUoIsYyO1Z
         OZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568939; x=1793173739;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dQaQFQyFMz3WaHz5uSFzXHRyL9HwryG8dy7Xw+d+Rd4=;
        b=p34SP7GD9Mt61MKwFEcs8Hy1p6zhKGG/yGq9a5MesNyFEkMIWv1cytKXLZP3zhsSCu
         THFv8hSxL/Mx697auhjm/ija2goJ0Z0PJh8aZkX37VChtivwy/DNBASHMBDir/I7ArWM
         qqybKXQo8LpZ1oE1pQZ61m3iuJow5iPl6vkJK2fn6z7xUF8sh7MnEFPiM/fMOpnzJ6f6
         WPzi05X1LGQHQbr4GwE9jJ1uPrZbEerKjy2dM7AiuShQtt8D2AK9FaV2yr4AWDd8/VQG
         AjhO9iNYupc1D62kYvm7+swJz7xVtWjnXeu9AJKQ+1F2ZEfTqX9QS3bUp1su4KOaQK6g
         VcfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLy69oYzAVjfxAk3x8MrO0dghKcaQ/8/06OTAMu8WzzxvYguilPDyyhpJ29U4TYdpKk2zUMIvAenE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKt/ef5Jv83G6E1KWgv/AmcM7o0SFilm0npnUyKeQKsecQ9KHtO
	nFakSdHHHSLBoizYaWSlTdwpWd9ryFzHk7ucwu2UjIXf/vhPEV30NjSoQWjWj3U3lIg=
X-Gm-Gg: AYBFou01tETTouoPgP1O+fHZ558zL2uQHRXkNMVyyOo0vWwPCpFYaFS6fhFOigxlGvC
	kbFKAk5XY9UAKqj7QURENaa6OO+XW6UyU1QlpnY7YaQ3yn1ovrXQ3m7gr1LBmQZhCZkSyjWSvdO
	zl/OH+PT1OK6owQnlripuNzWyJRczzs+IKMF5lIv+0ab7q5XLH9CqVKQ8yS1oecHHt5tPdtmZAO
	BpMDT8cc86DTXcGMvyZsZISvNAXERzP8xWae20UYyMIkgYiAUUpvbkB4x0mfE4bGp5/Dgf5iiyE
	LsyklZFM3IgHWiZjSfAmnZofkHVhy7FtqJZYn2KkFZXQK1UC8Y+Pu9CXFCpbdII7O62Nj5HBUOl
	LZ8s8Zm/rIFztaTOim2EmTtnMZ8indNDd3Jd77G6m4CnbAAgrgeci6CgiUUV5Hb9s6lYqK6PNq/
	rX5RA0I801u1bTdk1YkzpRThVE9S58yx2oL4KVEqHpnNrOkUh+jFcW/BpG28QplW96JZ61j/Ti0
	VsSujFaGubsTC94CiHRgcTDVF1da8f8jdVYWe21078mXnUHCvv1R0QzMHT2SMTQOvMrkrnlsoT1
	hA5ri+lINUOyXr/0VQ==
X-Received: by 2002:a05:6000:12ce:b0:487:13f:f612 with SMTP id ffacd0b85a97d-48e264d2161mr1566794f8f.37.1792568939419;
        Wed, 21 Oct 2026 00:48:59 -0700 (PDT)
Received: from ?IPV6:2a02:3033:701:244:19c9:79b9:fe6b:6f9? ([2a02:3033:701:244:19c9:79b9:fe6b:6f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581f412sm3923306f8f.16.2026.10.21.00.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 00:48:58 -0700 (PDT)
Message-ID: <85cde6cc-fdea-4bdd-8575-7e9d50c8781a@suse.com>
Date: Wed, 21 Oct 2026 09:48:56 +0200
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
Subject: Re: [PATCH] usb-storage: option_ms: bound probe-time bulk transfers
To: Greg KH <gregkh@linuxfoundation.org>, Lee Yongjun <jun85566@gmail.com>
Cc: stern@rowland.harvard.edu, digidietze@draisberghof.de,
 xiehongyu1@kylinos.cn, linux-usb@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com,
 syzbot+7317196294d50d6e55c3@syzkaller.appspotmail.com
References: <20261013132033.4352-1-jun85566@gmail.com>
 <2026101310-crier-december-be03@gregkh>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2026101310-crier-december-be03@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.10.26 18:18, Greg KH wrote:
> On Tue, Oct 13, 2026 at 10:20:33PM +0900, Lee Yongjun wrote:
>> The Option device initialization path issues bulk transfers
>> without a timeout. If a device does not complete a transfer,
>> the USB hub worker can remain blocked while holding the device
>> mutex, causing usb_device_read() to hang.
> 
> So a broken device?
On a generic note, the SCSI layer is ready to deal with broken devices.
In consequence, so have SCSI LLDs. We cannot hold a lock that will stall
the SCSI layer in error handling indefinitely.

	Regards
		Oliver

