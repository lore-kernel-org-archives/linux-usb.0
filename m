Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616973;
	b=K6mAEJ60MBB5HfIpZHG0PKoGI5qn/pdiDY9jUwAlYqpOzF7eN/3WXw65lJyaMSTjBm+F
	 GtbPp9giP94ayeOWs0SzF311hU/W8W9annQ/4+eovFWNn+ZldKdVVBTfMbAE9DGZakq5Q
	 HgbynV8RoTmBC/u0BuR2d3/X+cirpHAiBaLeiDb6tDX9fWAmTzSaQ5SWSb1Zi1jO9CL5q
	 Fqp86UkXbOLjFyMi5/st8m1gXgfgMN4Ji3L1ccZ7wC1ZhyyqiREGMXc18U3fMuB/HLmjy
	 oynZh5JkNSQd+SU+QLaSNwh1zVtUPKt0JSK1+W0lvXUOvYIWDVu4Br2QaBQwnYyTrIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=dEHXRV7HnjpoU5kgdWl9W00WxAauTcUpdR8PSPPyM+k=;
	b=wK8F1UKbDqJZanXAvsCYJPEdkRO+tQd/8FkLaHo7sC0UisUsvGgLRqc8/fXyqS5DpLEW
	 J/y/hty347E0a13vVPBJ0iLiym7+HXOGYdMLIFYRZcKXxks0NWicA9L3I73BQsZ0OG8vw
	 oND2BfDwbI8SC9y11o3XN0Xldpks15PWcBycORl2sE+b9lC4Beeyn4wdA8/l4PDQk9qDR
	 i9sSC4HkLs/QLGiNBsSB+7OSGY5i+lZmF+hYTZ7yMCuxodbGOJivf9VYal2ZF9nhcpkAs
	 qQshLJJ/7wK5vIKJ6oHfCbjRfP25lJ/IqXVD13NWWzQPeaI2WvqMADgzh8uJDOG7wYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b="I/CRJsy3";
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77397606A329
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 14:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77397606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=I/CRJsy3
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-55d30c054dfso61623081cf.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 06:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795616972; x=1796221772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dEHXRV7HnjpoU5kgdWl9W00WxAauTcUpdR8PSPPyM+k=;
        b=I/CRJsy3JkFBB673pO40I8toSCzCOZZynydAyaYcvjp35MHkvgnmTcJd2l9wyBhBNy
         C/Lf/4dVPIUHFxyVtKBUsqBGMHrWgaq5TS1TesIGZQRu7bA9FKPHjVWvh0ikBmhI9p9w
         Difkmhn8r5VeeLmlrO8fVTzmJzscIdD3XsiZ9CFtXLKzRUlEO5esYgZmfy2PxkETkkde
         NR5L55W2qqVTAajNsM9bBy88Z7dsQGgHpb/VxH18luo81vD7S5Uw+Fp9P//La+QWAnTN
         7zIXIX30gS/mvO9zaRdURiQz7Wj02q6h0SwAlVye4xOjgkQc0tlthUXKAoOEcLU0vHgT
         oxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616972; x=1796221772;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dEHXRV7HnjpoU5kgdWl9W00WxAauTcUpdR8PSPPyM+k=;
        b=f4lV3WY8dYrQvc4xKDl5etf/XMFIohI082epFOpykML9RkewQeFXIGd39rbD7U4XZU
         w6o95id1m3DXpipnh6g/pZ9FrS0CBZSf3X4d8BH7YFzlJBGHjS9poIxq8dzpCFF0hUDm
         Uc9SX0N0vSuqZx15h19HaT+dfjhrsEQRykac45FEMeKUcIN+l0Ypms96NQ5QgwzA6i3C
         LcQI7kD4pIeCiuO2P32fCPwZssRQ7Q9bUDtvYlbwk5IQLUWW4J4dpf1jizWrJyWV/BUs
         Ojp6LGTwjx6h5o5rpdTRVZypSNYIXRJnpTtU1D9nL1fDi3eUKkR60aYCszDL8ruGckMp
         amxA==
X-Forwarded-Encrypted: i=1; AL+hErFXB2EMusyZ38roX1Q7OQCmnlvz218MyhKAh9oS8KgsyCDoSkyoaZhOAFIszkbhpBsAURgVhRApw2I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vtfgrcRLdAFMHDmwPcJ3LbD/clp7OvalNTURmviy5cYKpJdFy
	LAWverQhM3TL+90TsUPFElQcNx4Dhkge3qAUtVDTUJMTcB/xfqYaRhKgXbJSef8JmQ==
X-Gm-Gg: AZFdTZfKbTrNp/HMybFq0DRu6fkSYlFCvwQcR/o2T3LPWd9fnopFYcBgcd+Luky7rpZ
	ZHcCUHrJoAxmEvGP8PNNH1tvGpH2s9OAIZ6tTuSCoxILcRFr9l93qPfNa2K7VzY9MpcAmvdOlKm
	s8UfmrKlw14io+dcOwc/oaBa2zmB2cYb5Gavh5SSzndO1OyX3Gz7Vdkj+lvudF++44OzF1oxZz/
	T4NPkjuiQo6PjhuPyqTDQpYwA1cR77HTnJIivKHK3EZu5P2dUhLWI3fnci0trhfUAIYXK/QCm57
	aXkqc3kMvWPnJCRPWE8NamLGLJaCLuAwLlUSUPDAxvPmYXo9FmOo+Aw5buYB46AsFM+P3gdljLu
	om2cpHBH2R93oR0ouY7cwWJiREu8gKG2dPR9tbOvxT4M59pYYt9xRZpeQOKaIcsYfED1yVKYSY3
	lE0z6d6+OfYexscZ6YifhLqePIDWcU+N62hXe2RrXb+4VvDU/602z5VYxDW6Vy0qhuABotheX7d
	43VVzPzfKfQNGfBDLDi/7D6C48UpzOpvNVohN1DGUtLL36C7DknQ+D5maGD0bxcIoVtLW9l6cJz
	KeZay1k4R+N94Eq4ahTTyIwYEr7tJw==
X-Received: by 2002:a05:622a:2512:b0:55b:f867:6f4e with SMTP id d75a77b69052e-55d768a4856mr348057771cf.5.1795616972270;
        Wed, 25 Nov 2026 06:29:32 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::9a34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7882e2c6sm159050181cf.12.2026.11.25.06.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:29:31 -0800 (PST)
Date: Wed, 25 Nov 2026 09:29:28 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Kuangyi Chiang <ki.chiang65@gmail.com>, mathias.nyman@intel.com,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] xhci: Handle missing USB2 resume events on Etron
 hosts
Message-ID: <c5649772-9fb3-4644-a08b-bb165f0173ef@rowland.harvard.edu>
References: <20261123072320.5967-1-ki.chiang65@gmail.com>
 <20261123122343.6d3f8866.michal.pecio@gmail.com>
 <CAHN5xi2dFo2NFbMb8t_5uugX56Fq2=Jj3G2_5xA0-b_NTjQsSg@mail.gmail.com>
 <20261125120545.76f07ed8.michal.pecio@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125120545.76f07ed8.michal.pecio@gmail.com>

On Wed, Nov 25, 2026 at 12:05:45PM +0100, Michal Pecio wrote:
> On Wed, 25 Nov 2026 09:33:38 +0800, Kuangyi Chiang wrote:
> > I tested again on an EJ188 with three USB2 hubs connected, without the
> > proposed fix but with extra local debug messages to detect ports that
> > are in the resume state without a Port Status Change Event.
> > 
> > When I connected the first mouse to hub 3, I saw the same behavior as
> > in your test: the USB core checked all root hub ports, and all three
> > hubs completed resume (evt 000e).
> > 
> > However, when I connected a second mouse to hub 2, the root hub was
> > already active. Port 1 also entered the resume state without an event,
> > but only port 2 was reported in the status bitmap (evt 0004).
> 
> OK, so I'm not sure how you reproduced this problem on the two-port
> chip, and commit message was wrong - the root hub must be awake.
> 
> But now, if I disable root hub autosuspend (echo on > power/control),
> connect two devices which use autosuspend and remote wake one device,
> the RH wakes both ports and only generates one Port Status Change. It
> seems nobody expects the other port to be affected so it stays stuck
> in the Resume state (SW is responsible for transition to U0).
> 
> I don't see similar behavior in other xHCI root hubs, nor in a few
> external hubs. Anyone knows if this violates the USB2 spec?

Yes, it does.

Alan Stern
