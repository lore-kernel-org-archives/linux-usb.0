Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368463;
	b=JOyI0a3VJUM6IKPIr4hzgzZsRe2A2oJWt4jqJMWh9txTftCozxg9tO6M1efPdJkCbifV
	 89ujTNn0lXaXoXoMfrwayNimBPTjc9tWHruLJw9BeUv5P9LBUdA3trgPF5k2cMvgzM3K+
	 hIgIztUiMVBhf7fpVBURwF7puWM/nLTqKR3vYUT4rRj4LjRSdWfgfDs6A7K9YK0US8ZXt
	 SEhWpcfQgq50K0fxdmOwDVGw73owtM2ztv6l4iHOQh2JyRfbweGbanmjAghQQPjr6MmJf
	 wek1dZin4Dvm9n/dfRrUMQPun1IxXaWkzR0xDZThYMfjDJEbl9lLifbgLl7Jv2+dr4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/hIuaSXC/8qKVAwXvaUJ1vLVQZIbwa7mDnRwYchKUok=;
	b=b1f6REHCBd47p3Rlhyk60lmDC+Vx/8V9Ng/T2tuHU6eega8Cb+7qcKhlfR3U0+0WYqkG
	 sIEIB9YYXBXS0B8Z6tIs2pG5WijfsHrMusmyZIYFIj3+wE0/0UzjC1t5wABZxTw2MdcLL
	 RVYj/hywFHe0B22mk0K+UHBfHYOFlzxVfmKxnZaFnoRYnzdShjcMA3eiKSVppjfFnBViK
	 YwQJcq1E2iC2pBFq7smYRuAMXTqdQwaBlSk04yEVexm8cwrbVxCAqchhvdD75sxcc4MtV
	 fBPHrBlMOec/jp7OO83oH/qZJeheKKDwLv3yMaZzpDhhj4jHqWQHrj+aYY8XWNUvieg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWaM6t2o;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA390606A322
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 13:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA390606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWaM6t2o
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so5961745e9.3
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 06:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793368461; x=1793973261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/hIuaSXC/8qKVAwXvaUJ1vLVQZIbwa7mDnRwYchKUok=;
        b=XWaM6t2olUZqZIxFriVejrYzehUyFljQN5E2CvGc2lNTgSVwJI5hIRBfuMBSzYJW1b
         573FOamRVec1VCMzletpzIxN7E3qGFoLJjVRSWtq0Lg78fbMdn2eGoHbT9tpuw9eKDkb
         hOI6+H/tt2KyetfMO7tK4BJUqLfd2n0gHAw6pZ2biqL5A1JuXRWsNqOeHLx+rByImhzv
         RSfl6WCRNYCVJIXSK6BE78UHY+WWI6kJS+Q6a9blv1tMTv+RJoO0dI7kE9Lcm5F7Frgm
         VeeaM21RYMDPzOqVzVtvdhncwp35WhxDJvWrR+HwCT+mVTFh8BL5Ke8mkmkbnyPnrd9h
         LJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368461; x=1793973261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/hIuaSXC/8qKVAwXvaUJ1vLVQZIbwa7mDnRwYchKUok=;
        b=YcfRAoPynK0IO0V8nAVr5XPBbAN/gEOaTKfbUCyKPkC3TFk+SCq1Hr6HjsQP8A6R/3
         Dn8WbhTMie8OFocXdcjSrRMOKaIuCEdwJ0kQ73aPmuU++KvGXwtcgV82ICj96xPKYyoy
         g8yVRecini6MppbyXgpWtBYDiWwmUJSlvJB6PUbznOcDXJQzTe/os7tq+eJYnbvjyL5C
         Jjj/2KV7CH0flUDPD04jEnqp3NcZQ7RptLqz+ynPiB0bvf4GTsfMBxGCfwkOBjtvHfqi
         R7xvNHsbeS0UGXzNk4NJ6LjyN402qavpzkHvw+AjMsGgq6SBCoo3Idxh4W2YvhgR0MX3
         mugw==
X-Forwarded-Encrypted: i=1; AKwUvBxVGXVEUF/vaQGFapyhYRfgUbI50SR9EGdH1Q5rmTtEytuL7KMp3ZPb26eLct+16p0QGmqOsFIrNNk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLV1/X8PGIXIRr/Fo7GWbToXxY8lZiwuprHNuzgiv/89DQ+jF3F
	Puo4/qXa0ZpPI7XkTIfUsfmLQJeflBCmlSIoa72hbAbCpRrloDO/FxbG
X-Gm-Gg: AYBFou3Q59Z1N+XhS1RZUCUlU1ijW6Fq8clHfjEOuRUfYqNXN7yd8zSOr2MZdJ419lU
	rD8252yuJKMK+kazwVYIVBw263qtwFOFznN0T5rmWE5/1M/5g8Op6muXGhTq8NbNaANI1PiSFxB
	a4TiTEkZiJ2pSmw1jTbH5QkJU+odx2rz/USOMyv8fBZBkw01hBy71mq/8eyIASxpex0UDd+zZ13
	4KfToyLQmkO5TmgOkc2bNdoOibRH1tA4xs4AWtJbdx1xFDSddmSBIE1xPDT2cp7UvdUc+jc+Ofj
	Gkv0h+tJeY8IQ/q35CI7/gy8cvYJUXSvTyhKVxxRtVsiS/Gk6GX+KEZWjg2AW0HqFzbshE8yvDD
	B7Hp52v1L2voG4IQ/AdMkDK4AtdwwPeuPDf+T/HNj2pU07b2bjdQ1HNmQHcrUnC+IK9PQccKm8E
	RyYkj+aL4SdXhqQdNO6nZdQFvI6xQ0j4v24wMHF6/hWiMVk/PnfUBnBI8YSgpprfS+us/1Mxfoh
	cFzgHN9Y03d2Sqmg+5VamEIil+uRJlTaDabK1JerLXKeLyqIKneFehPQSIdCQns0Se/tUdlWgGi
	G703n4Q2FDVtLrIQMsCZKMrT6ACEtDOEVeLocOiJOZYF7kK02qlJ/ku8PsaSO0+966TTfM4nj3M
	n+4P06QXrd0xHtH0nkwECgV98NVDpSxTK2ac9DZn+CZ1/H2R3NqIdylgCm2UsKsi3DJ4=
X-Received: by 2002:a05:600c:608c:b0:4a1:6c0c:ab93 with SMTP id 5b1f17b1804b1-4ac190497bamr46672575e9.28.1793368460933;
        Fri, 30 Oct 2026 06:54:20 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0950d533sm34613455e9.3.2026.10.30.06.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:54:20 -0700 (PDT)
Date: Fri, 30 Oct 2026 16:54:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alex Elder <elder@ieee.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Frank.Li@oss.nxp.com,
	Frank Li <Frank.Li@nxp.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
	Karol Wachowski <karol.wachowski@linux.intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Alex Elder <elder@kernel.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Guan-Yu Lin <guanyulin@google.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	imx@lists.linux.dev, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/1] PM: runtime: change stub pm_runtime_get_if_active()
 return 1 when !CONFIG_PM
Message-ID: <auShiOI6Hmla6XxR@stanley.mountain>
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
 <auRb_r8ZSSU-eHZA@kekkonen.localdomain>
 <9207a52e-2d42-4e10-b777-2988e84d7dbe@ieee.org>
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
In-Reply-To: <9207a52e-2d42-4e10-b777-2988e84d7dbe@ieee.org>

On Fri, Oct 30, 2026 at 08:46:07AM -0500, Alex Elder wrote:
> On 10/30/26 3:57 AM, Sakari Ailus wrote:
> > Hi Frank,
> > 
> > Thanks for the patch.
> > 
> > On Thu, Oct 29, 2026 at 12:30:37PM -0400, Frank.Li@oss.nxp.com wrote:
> > > From: Frank Li <Frank.Li@nxp.com>
> > > 
> > > When CONFIG_PM is not enabled, all devices runtime PM state should be
> > > treated as active.
> > > 
> > > __pm_runtime_resume() returns 1 (called by pm_runtime_get()).
> > > pm_runtime_get_if_active() is the try-and-get version of pm_runtime_get().
> > > stub pm_runtime_active() also returns true. So pm_runtime_get_if_active()
> > > should return the same value as the stub pm_runtime_get(), which is 1.
> > 
> > Shouldn't the same change be done to pm_runtime_get_if_in_use()? It's
> > otherwise the same, except that it requires also the use count to be
> > non-zero.
> I think "yes."
> 
> I think the logic for !CONFIG_PM should basically pretend runtime
> PM is enabled for all devices, and they're all ACTIVE and effectively
> in use.
> 
> That implies:
> - disable_depth == 0, so usage accounting would (if enabled) be done
> - runtime_status == RPM_ACTIVE (power is on, no delay)
> - usage_count > 0
> - runtime_error == 0
> - Maybe ignore_children is false?
> 
> This might not be complete (and could be wrong!).
> 

We could add this kind of information as a comment somewhere?

regards,
dan carpenter

