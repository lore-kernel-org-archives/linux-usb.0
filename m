Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB6A311592
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 17:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784051845; cv=none; b=d7FstIbX0zwbHkqmhUecDNEPriAEe91vCVIAAsruixE/+XC/eCd9lQcEGXVBk2MG+Ptq+R2RjBRjA4GYTsGcw9FHkiInEsHWbVt5OQH2MugS/USFKS38ue7t6ZfGpPlAR3Ur2edjZqPB3qzQAYK1SGgbMOZ9AM8gwngwKQGj7rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784051845; c=relaxed/simple;
	bh=YIcGNvcrqDqllfRXZXrmfjiv0xD1BjskNqrpMQiEHUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j+nGxLkUI+uBPHmZpQ9cNU4bdmIbOR9NbgV/H2WkQ1YU4g7u3LTDdwDfGV9cy4EQgFdYEPwtT/J8+kqhAdMhMznVeaRbYTf5xUGeu3XT7k/BpRKayM4aB56Luf5bUi/2nhCU4jzBLLqrg4uOrAfyAwIwmExEjVOqzQG14D1kFZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DlYidAIS; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DlYidAIS"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493f4638f4aso10849245e9.3
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 10:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784051843; x=1784656643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xINMORSf53UnWHp8kZa+pVImCWvM4ZrsqhIVQM5QmXM=;
        b=DlYidAISm+G8ebqxJedQE260AfTrcR0GPIa83a+cXxADzn3ZDL1DHUZOajvaAxLeP0
         CRhUWrwnpf6dZsyyt78MQvfqFaurBU7boHaqY98iI5ubz05ZXcCdPJIYCTnJKwGAlMSk
         Qq9qguauzv19rN5hGftbA+LVgkPp9vSpwD2dvFOsM6TgK7USFfb/QLNTjWkDDvWd6y7i
         SdB2Dxu8wl7gerYQdgxpUXeuUvA6/eQ5JiUxJfdxIUNFXAqDi3IqTinAQG1KjNGUoIoJ
         ejlerbOwcYjmx2GxTt5YWjVY2P91SAxs1gjqNniOBviFYHGtKEcgfXJBjN9Nj/SICz71
         cSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784051843; x=1784656643;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xINMORSf53UnWHp8kZa+pVImCWvM4ZrsqhIVQM5QmXM=;
        b=XRdrPzAX018D3TkICV8iAna37MWVhNzUq1Tm3OYTqlSZqrxLMuVq03OItQ6EOOv44q
         9avrpVy1UWWJMDQ7YFFcP0dn3fAX2IrGBYjBaNVv5taBgheD5JyHQL8CfpcocsYL72JA
         Yr9PEiwqUJSJt3xBW877gd4u6FcNWqleTGolw/b+SWux2qkuKxE8wwnXXAfhjG4gJELG
         w2BOvI9we8GxSwHDwQ5riMR5zkI8g3ZgcdTefJ0JF1gUxx/JAMhuoC96adE7kZniWBhw
         SvBXpg3pcjyF9tB2nTx6LAi9Lb6P2t4YK8qRdq/v3/3K/QuW6XM++KEp5JYVDp55dqUa
         y+Cg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7ir6LKq+eb+cWMwJecRUlaB8Rn1iHOEQmsXS109nEEzD9Gm4g1tOcuJRAZSvTJDIfgEW3vq+XQf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYjaxft3N6KJBF7zfQ02RAqLR9Tvm5PrdG3XY/p+lMcbAtzHuR
	rPDxLejQ8/HeUUInXcNoendlgWsJjhENRr5ysa4QnYGmclPyfLVc6MyuhVMd18oHsMM=
X-Gm-Gg: AfdE7clu2q7n64ftGF24+Hs2Jkiozr1KmSOqA3MPzvHtLfUOZVGesVO2f0XystSSKWy
	cm5Vez9ZT+nzO7FI6PLlQFjPWlubE6kofL99915p/9S7QPf6w9JTa2Z+T+ym0CxfOamacEk3t/V
	OCUPwLveb4ALShVD/E6XrXlbarDJApBa9zH+y1NF6NjRvv1nI1FRGS3RBMxSkdqgszmWg0JNfNg
	6RwvxcdpQclJtZl7pfzyJqIdFYjMjtT7/8kwdB81Zex/VtddR6T2eiwc0dlKqtnNoHtmKSN2Exk
	gG/dWiJxQfsPRb3qFue9mGY9ETO94XErLJqI9SqMyATtotSLLZ8ZcoLztjaklQN1casR1aouFcY
	rZQqzT4CJFzjUgeJUNbnE7PFF3FjirfydRazrEtuM97O+JT61ANlNlAN06wYxUGkmobS/NbkIrp
	ouyD521vg2xwMya5URg6k9RLdVHijc9W76mcJgqWc0FbqhIAdNkF5xXd4=
X-Received: by 2002:a05:600c:6692:b0:493:bf84:53d8 with SMTP id 5b1f17b1804b1-493f87e472cmr148524275e9.9.1784051842728;
        Tue, 14 Jul 2026 10:57:22 -0700 (PDT)
Received: from ?IPV6:2001:a61:13c3:1c01:3157:c849:4aaa:fa65? ([2001:a61:13c3:1c01:3157:c849:4aaa:fa65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49508728019sm90481645e9.5.2026.07.14.10.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 10:57:22 -0700 (PDT)
Message-ID: <8d39b5df-1b85-4cb6-88c5-7478d6f4bbed@suse.com>
Date: Tue, 14 Jul 2026 19:57:21 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint
 abstractions
To: Alan Stern <stern@rowland.harvard.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Oliver Neukum <oneukum@suse.com>, Colin Braun <colinbrauncl@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-media@vger.kernel.org, Colin Braun <colin.braun.cl@gmail.com>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com>
 <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org> <alVEUR0JrF1ga3S8@pendragon>
 <DJXPS0HY54SU.3JEDTA04V8HJ0@kernel.org>
 <7e6ebb5b-8ce0-4114-85d6-98cd11a3ad81@suse.com>
 <DJYBDUMUQ43T.3Q4ZG0FL76QH3@kernel.org>
 <fe12ec76-0f2a-48bd-8fd5-9b94b2600718@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <fe12ec76-0f2a-48bd-8fd5-9b94b2600718@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.07.26 18:26, Alan Stern wrote:
  
> At first I thought that we ought to have such a guarantee.  But in fact
> we don't, because the user can at any time write to a USB device's
> bConfigurationValue sysfs attribute even if the device isn't bound to a
> driver.  This can create interfaces which may then be bound to drivers.
> I just tried it and it worked.
> 
> This wasn't the original intent, but I don't see any good reason to
> prevent people from doing it.

I hardly dare ask, but what happens if you unplug the device?

	Regards
		Oliver

