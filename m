Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FDB1E2858
	for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 17:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782666129; cv=none; b=ji0DfqB5YtUzCSh5DA5NE+NfA6XpPlSpZiRXNoT+UVxJ4K6GVVMuJLpK9eMPlmy6iv/tiGTB+IuFmolo9LKQS5dAHRSq6bujMAHYbyGIrDgF420onTuhx+xKGUHaew/GlOm06L8F3qWfcHf+4fvR358X+qnj+TXJUF2t7FDmCak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782666129; c=relaxed/simple;
	bh=3OsNKGn84AmZ7EpZHONA4D/sDqC0/NfOYHvlRuLYVb0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C3SUYBCKeAYGldQg9XcFgDGaxmYqv+NVnbRMcK2a18P+pTdHLBqU9kqU68f4xOC4K/KmpzJY/xv85cmUZjx15XlHT9o97zY/g3xaCUJgERq5/dkFUQkoSJIF39ZsZXhX6FSgHT5fgYDXPrlf5G2ahmXgJ+1quytLyqKd78Ly10g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pEOUIvb/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pEOUIvb/"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49395888c7bso15425515e9.0
        for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 10:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782666127; x=1783270927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVQvFBwvnO1RdffMStECk4dJQSfRULIl6EHx460540M=;
        b=pEOUIvb/4MIZkIuL+pC95YgEKqOE62Ma0vBd6s+iBvLfa4aFcauDFP3TOK8NtSvGUZ
         BsbIp2vR3PdopNLUsJLT/zMjgai8EU709ZC0npyt2918w53PA7OBXsPZKo5KjtiOoLbs
         zJrcloJG42z+LzTu1ns6hXqIcI+o9dSrwujg2oyeOMl263JyOwnnAJ6eAJz+xvxTBMgq
         iyLq6Cw4Ao76/hK9xS/Av8cNk+2yXcjfwo9fnQ5pjL5h4CSwH4GUIGPt6BcPIJTRr/o2
         K8T7FU9Z6+4xhLBFB59bLLzSmXxJ4pSWCrDYX6j0i40+4aSnqtZjxR6+5R/xQATe7UR7
         v2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782666127; x=1783270927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aVQvFBwvnO1RdffMStECk4dJQSfRULIl6EHx460540M=;
        b=GBM+GJEDzDwUnnVk/U+C+rFoUWyvnw8atbzdO+f9/YKY/qE2qtIsf8POyx78tvsofz
         AiUAsUfOHxuyc3rfdyWgEzYIyuYai4ihoQSP5nkSphCcPmOu3MNgPAQDOtM+COQyjfje
         iJftkJ4c/Z+y8BUd04qmdSmSEROt0e45SoG673YA7OWx4zCCrtn0mPbHdPICuEddNTBM
         CLM1sp5HtUFsCHliIYOZqazB95bGDB724Dc4Pk/KRuTBA/SjjnE53xMsPUljjhqXxHPO
         vURuIHfzekTnr6d0IfXzFcDg3YMoRvkKJsjELEIv5RbslRmxqywPzmoFFGRj/V/ian4S
         MhMA==
X-Forwarded-Encrypted: i=1; AFNElJ9tW0TWzQqD4YTgsKkHJinwBBYdJpCE2CiUKPJ8UBHEKy4kF0AOaOqhl0NHyKEE8/OLjnPlRxOmlvY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/1qu/77ssULYfbRNpcfgtbbDi049wPBdWrsl2zUp3AMKv8wKC
	kEc6bFuIjAYXflGVB1xoSN+iL9L7C7/hhaBwZbfYc+D89d9OaXnhywra
X-Gm-Gg: AfdE7cljum4uKAkfIXr5QELSklmgq/3mHxdpjc0B2DPM6y3j2M+aP6FQdiIbyQWLJwu
	XyqLCyihFvr6jdxGibGfqM1p0XjlhKmuPBUEij9Lu9DmwsPHo4f7zVMRN/117q1D/njBgr12mNq
	TQTVnsvIknRVc50uIzjAkKwMdvfLrNnpg5QgWe3Tjxfc7XrJNZRIrYEJ8D3dYuTNY9rF5MlUdJJ
	Bj9KoTlkkVogJ6hVk9JAuWIE43jjOaSBNW48vwQrlJIAY/eBDwmo7SBwZ6c8xIOi9VGrRItPtyM
	nq0dtqeeLgzamEswNR/cfHh+nq5iJ+b6GsfNXGl9TgcN4GFqynf2PSh5cdWtq634gMkSCSsYgOh
	BBt0VD7kW42eBplCociLQsJR31DdDJUHLQYWX67bjClBWunVYYItC5GvozFbNPfxQXj6JiIuY6h
	VhkCFInuc0ACa6X3oMONZ1qX7V
X-Received: by 2002:a05:600c:c16f:b0:493:a7fd:15d6 with SMTP id 5b1f17b1804b1-493a7fd1852mr32215115e9.9.1782666126285;
        Sun, 28 Jun 2026 10:02:06 -0700 (PDT)
Received: from foxbook (bgu190.neoplus.adsl.tpnet.pl. [83.28.84.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c2954efsm160059395e9.2.2026.06.28.10.02.05
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 28 Jun 2026 10:02:05 -0700 (PDT)
Date: Sun, 28 Jun 2026 19:02:01 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Nikhil Solanke <nikhilsolanke5@gmail.com>, linux-usb@vger.kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
Message-ID: <20260628190201.00afdccf.michal.pecio@gmail.com>
In-Reply-To: <62e1fab3-1045-41f3-bc74-4c7624011619@rowland.harvard.edu>
References: <20260623161035.5792-1-nikhilsolanke5@gmail.com>
	<567e8866-4308-4e5f-819c-fe778dbf74f8@rowland.harvard.edu>
	<CAFgddhJk0EYG71fnKdio=RHC-cH+JmL-EZ7-oVD-LdHoa2TBSA@mail.gmail.com>
	<5159fd69-dddf-4073-a8e7-95fa77de0b7f@rowland.harvard.edu>
	<CAFgddhJ2HeJ=oTBX_axMJcgJq7GXH9abe+LH+x9NGekGO4BMyw@mail.gmail.com>
	<eb0dfd45-91c5-49ba-a297-b183dbc52c8c@rowland.harvard.edu>
	<CAFgddhLZ9SuOzG_6mW09j9aDkCp6TedpNkzJ6TUD+DnR3TDLKA@mail.gmail.com>
	<02060df3-b8c5-4a86-b3ab-3a28eea8a562@rowland.harvard.edu>
	<20260628165040.76fd608d.michal.pecio@gmail.com>
	<62e1fab3-1045-41f3-bc74-4c7624011619@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 28 Jun 2026 11:48:36 -0400, Alan Stern wrote:
> > How about "keep unrelated changes out of a stable patch", i.e. always
> > do the delay (if any) after the first request, regardless of size?  
> 
> This is not an unrelated change.  Rather, it's deciding on how to behave 
> in an entirely new control pathway -- the one where the 255-byte quirk 
> flag is set.  The old pathway is completely unaffected.
> 
> I suspect no devices will have both this quirk flag and the DELAY_INIT 
> flag set, which means the location of any delays in the new pathway 
> won't matter at all since they will never be used.

If no devices will have both quirks then new delay added before the
first configuration request will never execute.

If such devices will exist, then it probably won't matter whether the
delay comes after or before the first request. Purpose isn't known,
but it appears to be rate limiting configuration descriptor requests
or delaying other requests after this function returns.

Either way, no known need exists to add another delay before the first
request or alter the existing delay (or its conditions) in any way.

In general, I always object to code which serves no purpose because
such code is easy to add but very hard to remove when it gets in the
way. There are no known users, no test cases, only paranoia.

So I would keep the delay code completely unchaged.

And skip other random changes like error string nitpicking. Reliable
and up to date information about how many bytes are requested,
"expected" (what does it even mean, to somebody reading dmesg?),
received or verified to exist can be gained from source and usbmon.

A stable patch is supposedly supposed to be 100 lines with context ;)

Regards,
Michal
