Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470823C4572
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 13:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785417866; cv=none; b=BcBnarYlbJ1K64yxF42IV3y02ulX9Oyj0SLJ/x3yAQlzM0A4vo6r8WSD1W55NGd7JFNYMOBRsViWAbCl36SXTocXYh1TNy8ohm7lQ+PgcBMzQGjDZIePnIbkT04UdDnGHjLmj9lg/S6n1i+uOFOkOo7gkYMnLl6lHvvf67ouAD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785417866; c=relaxed/simple;
	bh=Md/frl8yWKf8lR9dOidB4RavU7o+hXmiZX+xFsd4nPA=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=ZuK7NRsGI0gABgmYkrcZzjEdBGz2pL8LOSlie7Zn9zvr5Rt80ZhlGsb3MShJ78226Kdq0yttWPoIHi6VjD0TIzchViQq9DxFBELsDDIMKOFBg69OE95PRrtCcGxbzILgb6k87P0oxNGCreQrgzfET/uFCBQmosHXkwT582TAJrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=S8L537R2; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="S8L537R2"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4798bea72f9so1448016f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 06:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785417863; x=1786022663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w5uYq2ONkgdS6OQV56xVjV5bVrIUUtNpgOJwfKfYP7I=;
        b=S8L537R2BpZC2Q/ozLrNfZ3jcJbtSTduk9WuvPKqzxLO3LJp9XLibNBMn7D4i6fi73
         d6V2bgWjDgfZzsoSkBREv2VJasFg7MNAj1YJORWyM8uDUVQzhHQqaLE4KMsGWiD6Nw+v
         ZWD21Q3ij7xQILLkc3xhkO7qbhM1ymA4PsK91jobKg3fJqPdvZwB/q/bmha+a8f6NXHg
         521o7O31J+MwvO7/er08FHq7JNGzNxcqY1oz8by5bW1n5+yHN1QcM1vQ+08C085/Pf8V
         pJmtG4VDcKVX8VGsS8+rGfqRdznSl8uAL9wwTPA0JOvkH7WLCGnPNLE0dhOT9pmx5l5O
         31Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785417863; x=1786022663;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w5uYq2ONkgdS6OQV56xVjV5bVrIUUtNpgOJwfKfYP7I=;
        b=p84sy0nTqc5BzTE9SDHh7S/ssHDzqdRZkUq+Cnyvcr+3tbUUtAxTGBC52Ely4nIZTE
         c2/ck4EfKvkNRWZhLPH+SsJ3uoQTWVo0LEmwJ0SPyTGNwv2EWs1f6CjxX+ZN8yS2PFHe
         HSDHYk5uhs2IxE7Wj5r8Q6clVgX3XrOh+jpRQgdehyhf6NBj8JFdmwL/+uTa81lxMPG5
         Q/lzf2TRKROjfz3fL20KWR06gJkZy0Q/npCJzpvbLiYXCppU8ySqnk9yJwtI3BMc5nFl
         h/jD2indfXTQOCNtT94SmDFkEaqrjIFc6tEhuIK5uS16XnQEb78tjd/LKeuuq0lfhRR2
         6hxA==
X-Gm-Message-State: AOJu0YyWyDuZQQRXIslKp87rIpGslOZzfwrsXTyvE5TmH23jQEIXn3yb
	W6XMkqMLEiqFCad+4Scj9AD3l00vo+88ajP/aiU5F8LoqhlIcW/0nKf2YfoYKn/HCO2KjUAEec0
	g/spt
X-Gm-Gg: AR+sD12/Vc4U2WBtAltdGe7P8co6qg4I1JMS5x4WSZZpORfq4RJXCNlIopJkQOqm7TY
	vKFqRfuSW5ABchyTVnEcv8ixMOpSE+LtFeFtkKOpfu3XO5ayoF8tcpzy9LDU7K815kC4utc/cZV
	9aVLNQ4DV5DF//ESH3HiPEFOwpvIHY2/Lr5ZbyAUAo7Uod4dx+fUdxmmEkRgEAWytelidt2qC0l
	lAflrqz7C75fzZuFVISu/4J4/ijT5D2ElEpX59qjPnTPy6SEQEBUmzEt7MZf1eI8AEVdGfSDlZO
	JYQMbnSaNec2rZe3c+FO2Z+/pzbB51RShcdFJmnsp0e7sk+GT1+Y3RK6uQmL6OE6VHwglUIMLxa
	n+kuHuudQz+kn1dXaG8TmMhS1JPW4gjGjFOmozh9Lmv6/cUBM7C2R6G4GMgoq0IWomI5TL4Wgsu
	PeHJN8S3+sF6jAbdD5eYmKH/U+5xshfwtvt6LiEyZ99eqfg/UuN8wSKJ5ktObdSygcOSgVhw4Xo
	wbmoEClGT+TAIxnZ6HPcyvWmZ2SieSX
X-Received: by 2002:a05:6000:310f:b0:46e:7f72:b6fe with SMTP id ffacd0b85a97d-47fc81c5c4bmr3569488f8f.19.1785417863055;
        Thu, 30 Jul 2026 06:24:23 -0700 (PDT)
Received: from ?IPV6:2001:a61:1370:8f01:ca18:1a78:94cc:e030? ([2001:a61:1370:8f01:ca18:1a78:94cc:e030])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc88e4055sm5128653f8f.13.2026.07.30.06.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 06:24:22 -0700 (PDT)
Message-ID: <dbeebb24-cccb-443f-aa61-86956995a823@suse.com>
Date: Thu, 30 Jul 2026 15:24:21 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: USB list <linux-usb@vger.kernel.org>
Cc: kees@kernel.org
From: Oliver Neukum <oneukum@suse.com>
Subject: disconnect handling misdesigned on uss720
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

looking at this:

static unsigned int kill_all_async_requests_priv(struct parport_uss720_private *priv)
{
         struct uss720_async_request *rq;
         unsigned long flags;
         unsigned int ret = 0;

         spin_lock_irqsave(&priv->asynclock, flags);
         list_for_each_entry(rq, &priv->asynclist, asynclist) {
                 usb_unlink_urb(rq->urb);
                 ret++;
         }
         spin_unlock_irqrestore(&priv->asynclock, flags);
         return ret;
}

it seems to me that this is a broken design.
It uses only usb_unlink_urb() but does not wait for the actual
unlink. It seems to me that we need to count them and _wait_
for the count to reach 0.

What do you think?

	Regards
		Oliver

