Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D59217F27
	for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 08:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787472994; cv=none; b=idBoiGDScvQ5l98ooKZgu9gC3EwlHk0TpjvPXEKeIq0vfBMgewwfcV1yYRIBc+3/yhgmPafl21vISuTBdgErODUQqz5RiPSsMy6JfG1j8ZVUp+lzJUIbIiToLfb/ttVIs/a4gYhaVl2iSxuW6cBWFfzdvbaT2RGFdOVrSzIkcTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787472994; c=relaxed/simple;
	bh=BhwbpsARyPxk9fWPXCp8zQNF2jqsCU6NgXzTYhgj2IQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AdLum1x66LhsKXj0oe9QJtBEtqhj7jtqAkiqfSBxmpR7Eog8zsz9x3t9q65eZSvt68wUL2rGqWiuxXx8c5ApOnO8S1bytUusVOcHRAVo0Zag313X4d3VUr+8iKEzvP8BwwKGsnps66SyOIX+exOMgnfoNw0PBRzzG8fQUgu9TyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oZj9b0KT; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oZj9b0KT"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47de008b020so1284896f8f.1
        for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 01:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787472991; x=1788077791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FPtVO2IqXJnahImnb+To18BwB5dcSt8DZxfA0Asvvp4=;
        b=oZj9b0KTBEW6hpjjPhQ2XokqbXeJBPMONv4WhnFHls+XpbA1bPOhLFbejop4C3Chif
         wO3MCWhSFQnIKNXQLUzmNi3qxmax7qrcrKNcmMviSCGmFCFlXw+9yg39VZgF1O//NBWG
         dACSctv2Yr+J/b4gt8GpExK7njzmAxEBWSTV94LzzCAsOoH1MrA6HTUNyuUHjVT5hdl9
         qIMT1/d9xodEjGYS+e6g6zTN6C6L8Bjt2fsoxf4U1rgwLQdIlBO+MeZE7LW2cXe2tOeb
         q+boW14fM7lqboH3EN7IhYSSAyn2qTiI2LAAWHM2R9nK71WQPMpxz2mw+R7RNhH78kQu
         DAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787472991; x=1788077791;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FPtVO2IqXJnahImnb+To18BwB5dcSt8DZxfA0Asvvp4=;
        b=Lc4XwHDR6v/gzg3oFn7To6epf2i7ztnFNH7sZJj31OA2TXYxW5V1gqK1dTmvf/4Mmi
         XMwwfeswF3sYTZdy/e8oTBu+nkexbhN33Dl7JiP1Gz/bL7CNc04JvTFvkXMQTD5zgh5z
         5EGxSepTbVpUU+Rwavxhpz8VDlqFBhGXE5QVCWYBgV1ADyGrZjIobVaO/M9eO03992MS
         NYRyHWQxq4gdga1x6TdtIT3xaT8mnq33KQ5YWxWKGgOlh2RUvB476Q470B7lyrxipiUd
         b4V6z1pH+Bu3mZ8KXi0LAgKQU8pK5xDU8FCuLMvD51GzWWON/QwI+2/P497VdUaUQKzN
         RuZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr7jLcGaBgYxGB3QQCoZ77urU0DYMC85duesIFQZ352/DrHF/Jm/AfwS3UFgGOSXBVX2jjFn87rmeY=@vger.kernel.org
X-Gm-Message-State: AFuF++kRmpXTrDZ0AhoH+T4T86RzAzNf0UXfCib2TnaoaXN48jkoptZi
	IIVITudPjtsTTik9/QXmZd3HF09zJakd1+3U26+IxnhwyMEg3znrUPa+
X-Gm-Gg: AR+sD11OgLley8TsW270tKrVSfn+dkq2QhuhBQ0p0r4sAXBufHwij1BLvNRPWhl/xrD
	6LVAjewISTfDplsd+JOSaVwtdNbQE0t8zqa1r/2epNSO1VrXSRQwBdwCSHPsrgR5Ew5OrOohVoO
	3SEBFDA68/NBE2wBBUk6rwhV4Wlbw5uutF9qq9kAjNln83Fqo4aPoEkKiFZ+c0M6bkoHt/oV3by
	NYq54hHz+oU6/ZS73gk7Z91Iroy/zK4wnbsiK5XUGsxNkbYpEKwG9dg8LLaxCLATOQ79MMXl1IU
	fq5LKUMtXfupQklS4qU0X83ruCHNLhPPEygPJTFSO68muaNsf787YEZR/aEdTMZ01j5z9tJ0dlu
	9Y5Wr3tVqqnFBSxqJdZ+tqCWro24UvY+Jp7NpOAatxGwKxJFdKCqs9AjrRUe9gXLt+txTadnkTc
	a1dvMrceKiV5+06136786jpNTW2f70BklrDEzSPnUfTUxu5zfL5UuMoqQ1nONC7r0MPiFx/TR/L
	dMVCj0vaKApI5SlLCPbSlhy6A==
X-Received: by 2002:a05:6000:4683:b0:482:b823:cc3a with SMTP id ffacd0b85a97d-482b823cd2amr24472494f8f.12.1787472991003;
        Sun, 23 Aug 2026 01:16:31 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9b78eb4sm4281631f8f.13.2026.08.23.01.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 01:16:30 -0700 (PDT)
Date: Sun, 23 Aug 2026 09:16:29 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Sergey Shtylyov <s.shtylyov@auroraos.dev>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, <linux-usb@vger.kernel.org>,
 <netdev@vger.kernel.org>
Subject: Re: [PATCH] r8152: simplify loops in generic_ocp_{read,write}()
Message-ID: <20260823091629.1a8441f2@pumpkin>
In-Reply-To: <20260822230326.5d642593.michal.pecio@gmail.com>
References: <20260822202155.18632-1-s.shtylyov@auroraos.dev>
	<20260822230326.5d642593.michal.pecio@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 22 Aug 2026 23:03:26 +0200
Michal Pecio <michal.pecio@gmail.com> wrote:

> On Sat, 22 Aug 2026 23:21:54 +0300, Sergey Shtylyov wrote:
> > In generic_ocp_{read,write}(), the *while* loops look very strange:
> > the last iteration is executed differently to the prior ones, doing
> > some useless assignments before *break*. Move the code for the last
> > iteration out of the loop bodies, dropping the pointless statements
> > as well...
> > 
> > Found by Linux Verification Center (linuxtesting.org) with the Svace
> > static analysis tool.
> > 
> > Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
> > 
> > ---
> >  drivers/net/usb/r8152.c | 67 ++++++++++++++++-------------------------
> >  1 file changed, 26 insertions(+), 41 deletions(-)
> > 
> > diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> > index f61686433031..de9738bdce85 100644
> > --- a/drivers/net/usb/r8152.c
> > +++ b/drivers/net/usb/r8152.c
> > @@ -1431,27 +1431,19 @@ static int generic_ocp_read(struct r8152 *tp, u16 index, u16 size,
> >  	if ((u32)index + (u32)size > 0xffff)
> >  		return -EPERM;
> >  
> > -	while (size) {
> > -		if (size > limit) {
> > -			ret = get_registers(tp, index, type, limit, data);
> > -			if (ret < 0)
> > -				break;
> > -
> > -			index += limit;
> > -			data += limit;
> > -			size -= limit;
> > -		} else {
> > -			ret = get_registers(tp, index, type, size, data);
> > -			if (ret < 0)
> > -				break;
> > +	while (size > limit) {
> > +		ret = get_registers(tp, index, type, limit, data);
> > +		if (ret < 0)
> > +			goto error1;
> >  
> > -			index += size;
> > -			data += size;
> > -			size = 0;
> > -			break;
> > -		}
> > +		index += limit;
> > +		data += limit;
> > +		size -= limit;
> >  	}
> >  
> > +	ret = get_registers(tp, index, type, size, data);
> > +
> > +error1:
> >  	if (ret == -ENODEV)
> >  		rtl_set_unplug(tp);  
> 
> Looks like it could be shorter still.
> 
> s/limit/chunk/
> 
> while (size) {
> 	if (size < chunk)
> 		chunk = size;

I think you meant:
	chunk = min(size, limit);

> 	ret = get_registers(tp, index, type, chunk, data);
> 	if (ret < 0)
> 		break;
> 	index += chunk;
> 	data += chunk;
> 	size -= chunk;
> }

That is the usual pattern...
Although may you need to be careful to stop min() bleating if size
is a signed type.
Changing the loop to 'while (size > 0)' can be enough.

David

> 
> Then it could be do-while, because we know size > 0, though
> I suppose compilers may figure it out themselves anyway.
> 
> Regards,
> Michal
> 

