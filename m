Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926D343D50E
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 09:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784021192; cv=none; b=ZIbDOQOy1EW7rgr2sfUDp1DCMpAZ+ePbrE4f6q9HrWB4W53vgwU5ymuFvDYrW8O0BgASLrcZ9UO5DpO6BfgRsL4Ag3s4u+2cZGgWWspvZbQePSix2CXv+1u+RFaJsMK8lUi8dGRkhHds2JXvmVlI3OMwN+hzUl7M2aolZo62bwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784021192; c=relaxed/simple;
	bh=uk44179nBHQ0R0LbB6H0UBTLnb1nykhwAc8C7JE3Ef0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ecor1TQMxtzAl/zgmtUl80Pz2OhG3OBijH40jQZr3ONYOjOlRSHoDP6IK8BFR+57mz7jYBSwlNSwAT5JkkHnJhR3PQhbXnCtVsY+tZ4F3KF1H25fSFHbwByYlfm9hherqoa8ATFVOTnHp+BhSqBw5bTu7bXPvQ3uWZLqT0ur3mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=G6Asaj16; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="G6Asaj16"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so510162f8f.2
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 02:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784021189; x=1784625989; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GHRW4UOdyW8Ouh0luSp6xuWXdsWRjaIjBrR+ZbVhoo8=;
        b=G6Asaj16adtmQA3dfmnS4q/2xcZo4q/bc9fOBZMWcFDs9fAMuGJKcZWUbG0099G25g
         t2ZZIlETgU4lp4sq7zr2hOk6tua6AdIKpuf83dKdRgt3/7ZovTmI6jsq9T8SOTqJQiJx
         RfvpKo0P4jKKXJKIasGTMwY9S3M8rwQM4PnkT5MA8hWmjmiZQwft6YlQipCYpI2/2o2c
         +mVMQGsLA7u9PJFczb9ewrSsZwVjwaVNEULWzcKSMqkkIKvOEX0gmbmjI98T2mqH78r2
         FINNSAqHw9Ph3xEvgBvAuhyReo6wGNT6fcVYN5lNyAllnR8GjoOwbQG5zpkqrBHUXVLE
         dqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784021189; x=1784625989;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GHRW4UOdyW8Ouh0luSp6xuWXdsWRjaIjBrR+ZbVhoo8=;
        b=gbjUecx77Wur8vQTF8Gq+0pbdtvHgDbZLVuoQg0WjMhDVgsHyEQJX0kiLqsTfKlori
         X9b8mYNyL/uYMzz6ui1nlMb0czc+Hm8Ewd55Xr/NU/G2IkuncvFpZ0NWjjhnh1hIZKGt
         z07eIU5+gf56/9BvHtQES51XOrX6TK4gRcXrCAJggmQP6ChdYsRAkJnPjur+AHxcW664
         6PBG+M0YofzPITcFXWAICM66ScYnXlNaThahWX2+F7jwv5ONCFVqBb7Z/JnTuVKudEzK
         eNYdoNxqmEJvTGyrc2gs5TjUw8LKsnxPNbo8G2otXYSAciSc93FplT+fjvuPMPj358CW
         ihnQ==
X-Forwarded-Encrypted: i=1; AHgh+RpD/avVPnqp+4AiK6shx3locjfwKK1dbq3DqwF+6GP/PIUbb4HJ9m5fBt2dgwDqBTlD4gRIWRXtud8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoPJBYW08Kimv2nFMMeEtxInGFFakMJxObNiInj0kgrGrnl9Cx
	7hc7vVTXMb2hG5XUtv4OBQ7CL3qQbFDjQS0WaFc/P2ZTMHk23nwLGeC638btBHbMUJo=
X-Gm-Gg: AfdE7ckmPuFyVxMlBgN06tGNQkLnIsvIRwWngN+xke8Xz8v0FHf7pSxpJwv+W5IQEx0
	MEw7Dm11/cqQDe5uc6S92NQoOMXFYCfolLiTM/UQPSnxDwL0yfMi/5kgRNZ1Libzkl5F0Wk1SRa
	jl4jQ8acTwkEWA5fpj7S8XL6lWeYjg+GLOXl1td9hKr3BPHep9FHP1GDNOVDVSJGDWzi2BUeLq2
	qVsZIZRg12iVpYXNN7KFIxzxUfxRtg9SqdLlXCkbB211U0fEf3XrZNoMVLtulE1YunpG5xYUVZb
	R6Copc3Vcyh1WHazFMu0aqpJqmLxz3OiijwVGzJEXr3zPpsTovc5RySeFLBMudTq1VUQrmLMzXd
	K3Fh3x5MOJhqgr+fTWwVQI7K1XuuqFdnNdPrJ4UrRJws1BlAGHuRJiFmULwd9TM83N8fi2lip2U
	1r+YyHcl9aWkGCpX2RAi3IHcCxAVO1D9/dH4wgAJCw64log/9ZqkRST4s=
X-Received: by 2002:a05:600c:c2:b0:493:f442:3dd4 with SMTP id 5b1f17b1804b1-493f883befcmr89458285e9.39.1784021188734;
        Tue, 14 Jul 2026 02:26:28 -0700 (PDT)
Received: from ?IPV6:2001:a61:13c3:1c01:3157:c849:4aaa:fa65? ([2001:a61:13c3:1c01:3157:c849:4aaa:fa65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2f635dsm63848015e9.12.2026.07.14.02.26.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 02:26:28 -0700 (PDT)
Message-ID: <7e6ebb5b-8ce0-4114-85d6-98cd11a3ad81@suse.com>
Date: Tue, 14 Jul 2026 11:26:26 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint
 abstractions
To: Danilo Krummrich <dakr@kernel.org>, Colin Braun <colinbrauncl@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-media@vger.kernel.org, Colin Braun <colin.braun.cl@gmail.com>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com>
 <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org> <alVEUR0JrF1ga3S8@pendragon>
 <DJXPS0HY54SU.3JEDTA04V8HJ0@kernel.org>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <DJXPS0HY54SU.3JEDTA04V8HJ0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.07.26 22:09, Danilo Krummrich wrote:
> On Mon Jul 13, 2026 at 10:03 PM CEST, Colin Braun wrote:
>> On Mon, Jul 13, 2026 at 03:22:33PM +0200, Danilo Krummrich wrote:
>>> (Cc: Oliver)
>>>
>>> On Sun Jul 12, 2026 at 11:07 PM CEST, Colin Braun wrote:

[..]

>>> An URB requires either usb::Interface<Bound> or, for a USB device driver,
>>> usb::Device<Bound>. But since we can't derive usb::Device<Bound> from
>>> usb::Interface<Bound> a simple forwarding helper does the trick.
>>
>> That makes sense, thank you for pointing this out. I should have taken a
>> look at the git log for that line to try to understand its background.
>>
>> I'll remove the usb::Device<device::Bound>::set_interface() and
>> usb::Device<device::Bound>::control_msg() implementations in my next
>> revision (since they will no longer be used) and just implement them on
>> usb::Interface<device::Bound>.
> 
> I'd keep them unsafely on usb::Device and then safely expose forwarding via
> usb::Device<Bound> and usb::Interface<Bound> once required.

Hi,

you are making me think that the fundamental assumptions of the USB
layer are ill documented. If you find this to be the case, please tell
me what should be improved and I'll see what I can do.

Very well, this will be a bit longer, because I'll try to explain:
For now, there is exactly one device driver, named "generic" (yes,
imaginative). However, its behavior in that regard is rather fundamental,
so if another driver were ever to be written, its drivers would not
be normal interface drivers.

In principle the chain goes as such:

Device -> Configuration -> Interfaces

The dependencies are in that order. You can have a configuration without
interfaces and a device without configurations (it would be useless, but
it is within spec)
The life times are limited in the same way. An interface never lives
longer than its configuration and a configuration does not live longer
than its device.

This is controlled by code in drivers/usb/core/generic.c

int usb_generic_driver_probe(struct usb_device *udev)
{
         int err, c;

         /* Choose and set the configuration.  This registers the interfaces
          * with the driver core and lets interface drivers bind to them.
          */
         if (udev->authorized == 0)
                 dev_info(&udev->dev, "Device is not authorized for usage\n");
         else {
                 c = usb_choose_configuration(udev);
                 if (c >= 0) {
                         err = usb_set_configuration(udev, c);

This is the usual way a configuration is created. [You need not worry about
the other ways. They also call usb_set_configuration().]

Also important for this discussion is that this cannot fail:

                         if (err && err != -ENODEV) {
                                 dev_err(&udev->dev, "can't set config #%d, error %d\n",
                                         c, err);
                                 /* This need not be fatal.  The user can try to
                                  * set other configurations. */
                         }
                 }
         }
         /* USB device state == configured ... usable */
         usb_notify_add_device(udev);

         return 0;
}

A configuration is destroyed by usb_set_configuration(). This
is used in disconnect:

void usb_generic_driver_disconnect(struct usb_device *udev)
{
         usb_notify_remove_device(udev);

         /* if this is only an unbind, not a physical disconnect, then
          * unconfigure the device */
         if (udev->actconfig)
                 usb_set_configuration(udev, -1);
}

( -1 means without replacement)

You can see that there is no way a configuration and thereby its interfaces
can last longer than its device.

An interface driver is allowed to talk to two sets of endpoints

1. endpoints associated with interfaces it has claimed, accepted or is probed for
2. endpoint 0 of the device whose interfaces it has claimed, accepted or is probed for

(Please do not ask about cdc-wdm)

That does _not_ mean that a driver can communicate to them at all times. Communication
is limited as follows:

Communication may begin when

1. probe() is called
2. usb_claim_interface() returns without error
3. resume() is called
4. reset_resume() is called
5. post_reset() is called

Communication must cease

1. before disconnect() returns
2. before suspend() returns
3. before pre_reset() returns
4. before probe() is exited with an error return

The only exception to that is that you may schedule a reset.

I hope this makes things a bit clearer. Please ask questions
if anything is unclear. I'd be happy to help.
This area may be a bit murky because only the states of devices
are named and documented. There simply is no data structure
equivalent to the binding of a driver and an interface, hence
we cannot just give interfaces a state.

	Regards
		Oliver



