Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239604;
	b=CyidlyXCETGjPFK2dCtsWHQG2woupxROW/RN+kTJB6L7KctqBA8hja09KwenQ6hBBcZ/
	 ReddTCDsXoSOSskEKLhGF6jmAzyLkBPRvVa2AM1B0Aup1nblkavI8mwJ36VyE0jejZ15a
	 DAakfie5lFZfGj80QxtBCWplmx+gvXrrXkj5VRIl1UJ+vDMr9cSxZ4TRtjgyJ35FmNY26
	 rGW1qcF79Q817rKSEAjC7Ddt0qNJnnxUqaRRvjgbyqGH/0puc2TdaApkNZgpGj9dGynjt
	 /R6+mV5WfaV9SR0HsMZiSzNROLeQbosgYJJJctHhy+pPHatHa2E/IYSO4ySbxBSmO8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:From:
	 To:Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=D5Q+E9tn7HiIeANz8X44oObsdVCCkRXBa32pfwmLNBg=;
	b=utLdTpigtEs563luNNj5cWaryIgMXuSVkgSqPRP6+/2bOPnekoB0Xd7umfcmipjRW5EP
	 hUbsiooOekMxlSjeTmHSk56E7HKHPboC2OsWHukUD8mJAFEsFePRfXBsfkqFHs8Ue9gix
	 WcAj0FnKT3TRAB4ISghG9tJnSV7q8nmr2Cj/PlN0+MWeC85jrNlqs6+L8YqaecaiqIDLH
	 RANHMOI/mvGe/FjoAXT53PPQiQXxpBfQwR+X2RAGV5SnuXX+xFqwXRbDyCZ4nt/MtQo9S
	 Zwq5+dOQUmct26uZx1r/i7c3cFWXLHGyy8Uc/0II6zXu9qQHwDFl1rSGb3qGQk7O0uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BiwCV20l;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB364606A321
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 15:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB364606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BiwCV20l
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so15206425e9.3
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 07:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794239602; x=1794844402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D5Q+E9tn7HiIeANz8X44oObsdVCCkRXBa32pfwmLNBg=;
        b=BiwCV20loLeAuRIumegQxBnzOzUvf9h2vlrTkSgt2cc+mnoTpIIIBu6670VXvlFSHj
         XNaGXCX/kDi5i5jgxlNeG2PPHVIVYvqapQaj9m1Xf/ff1RNqMhR/Bfrb2eGAppCLY1hn
         1SdUcuz/bfZmOUqVE2oxERMsX1V4r/uMVqP2aQAtY5wxsPoB3y6PI66LkDjxl0unfQE4
         vAgq04Opt4dTu2FBY343D1oWxJ50lHYGNMWUx1ZAKBJ3Fd8/BQEOjmBZxDwBionfwwZZ
         EPU0yEqBQ+rSTBZAA3Gc85jXY1SNyXnV0rjUw+Iq31w2dX+OxYxHlQ7CIsjObnc3TKCx
         aQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239602; x=1794844402;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D5Q+E9tn7HiIeANz8X44oObsdVCCkRXBa32pfwmLNBg=;
        b=ecJs+JZDVz2IZsQosn+RVnynLPsi2Y02T8Dz8m52IsC5W5BZkpClLR6YbEMiLrQimn
         HCDqzx72vloDHTI6hz0z3m9OvBfJ5BwAw+kDlVtbFutRepWRz0UOrpybZ5D5Z6t+HT9K
         FoHRNclMl+uU9WT1BCmgAEZj0Gldz07/Bz8UKpCp0TWWCCGdE8Sch3zNru6N4FSn8bND
         31vg6ve/vXnIuBbJ12FlVrXPR7J58I6Y2hqPe0S0iqOlL/Ve1Qi9y6voNSNHmVtUmqML
         lVWXXY6ZAexKwToGyMUt3elmT7J4PhnXfCrNdcOK1YTX27vprEHsVyi9+NL67SSvDixx
         de2Q==
X-Gm-Message-State: APuU4Z81Kr4osiNh/bvHfFt2nB1wjkkIyO84WWSAbD+/Nrp4cpbt7pi9
	zz+Op431PaUVlqOH3m+LBPnEy7rwc1Ue7ru1dt+I0i+Ru7D5u1dNkstSNacXdXeC
X-Gm-Gg: AYBFou2HOyC+MkjrUTRcA74SPzjoPqVhOJzS3Yi2G/xteAYl5Och9C5K8XPoa4chIlq
	bGTbKzDxWd4fNOuWauymPKOlqK/V2r8jtBBeZa1z4QWkYs1CPeNamUaDaQQpz+nk7EHYGw27b42
	5xFDieQKJ1a8+1VZSQypTrJ00DREb9Tg01HXtWP27Hx2n7VxZLiUhEwTinxRbVvQrqjYlGwLrg1
	qSxAGbykjcWK5+NFEwCoV4XbO8KcVZZYGF/3QUaNhvLi10L4bJgzLhMWntdAQEK8AsyrrioXrGu
	pyjX5W9G+p6aS9dC3w4oswyu+uKdPISuaC02O4nmg9JOV/lpDZTITtIqB2pDkvxQZsDHLvz+/Gl
	4NeZBT3/3704UUVAODa0eM1RTKD6T1uprIuUjPQGHbjftytClqHXnj4joTtbCaABzFvFf/8uBZC
	MzTCGy5e93/2fSimguWKcPaicKeKWokdKOd6cuU8NsmA30S3hGq5MafVlhOr+c60Fs5uviCHkLV
	JNR9vswE/F298q2n0KETLzanqUMjyV0ZPbK5Jh+haHh/ANqLWZ1tPWup3MICJW5DXhPVX5GaSym
	2dG/ZTEjwYeC3vMAMWNVjmUpNcUlfGydUBj+kspLQ8F5SNrpnWneaKRfA4Usj2Z08g==
X-Received: by 2002:a05:600c:470a:b0:4ad:5e09:ae43 with SMTP id 5b1f17b1804b1-4b963c81531mr74299565e9.29.1794239601929;
        Mon, 09 Nov 2026 07:53:21 -0800 (PST)
Received: from mika-amd-reply.eml (host86-185-73-183.range86-185.btcentralplus.com. [86.185.73.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783f1d6sm10542798f8f.46.2026.11.09.07.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:53:21 -0800 (PST)
Message-ID: <6af1ec71.fb59a2f3.1b24d6.5d62@mx.google.com>
Date: Mon, 09 Nov 2026 07:53:21 -0800 (PST)
From: James R Taylor <jrtaylor11@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 Sanath S <Sanath.S@amd.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: Re: thunderbolt: AMD Phoenix USB4 host advertises Gen3 Support=0 in
 SB LINK_CONF with TB5 device, link stuck at Gen2
In-Reply-To: <20261109155007.GV176724@black.igk.intel.com>
References: <1794143745.17311.hermes@gmail.com>
 <20261109111852.GQ176724@black.igk.intel.com>
 <1794223545.366398.reply.hermes@gmail.com>
 <20261109142041.GS176724@black.igk.intel.com>
 <1794235167.3657.reply.hermes@gmail.com>
 <20261109153955.GU176724@black.igk.intel.com>
 <6af1e999.9efe04cf.8f35d.ae23@mx.google.com>
 <20261109155007.GV176724@black.igk.intel.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Mika,

On Mon, Nov 09, 2026 at 04:50:07PM +0100, Mika Westerberg wrote:
> That's the host side retimer.

Thanks, that clears it up.

> Agree it looks like the AMD host only gets the link up Gen2 for some
> reason. It could be retimer/PD firmware issue. Anyways I'm adding the AMD
> experts if they have any ideas.

Thank you very much for looking at this and for adding them.

For Mario, Sanath and Basavaraj, a short summary of the setup and
what has been measured so far (the full logs and tbdump output are
earlier in this thread):

  - Host: Minisforum UM890 Pro (AMD Phoenix), BIOS 1.06
    (11/10/2025), AGESA PhoenixPI-FP8-FP7 1.2.0.0a, kernel 7.2.15.
  - Device: Minisforum DEG2 (TB5 eGPU dock, NVM 62.42), StarTech
    TBLT5MM50CM240W 0.5 m TB5 cable.
  - Host-side retimer 1-0:2.1, vendor 0x7fea device 0x1032.
  - Link comes up as TBT, 10.0 Gb/s x2. Host PORT_CS_18 reports
    Cable USB4 Version 0 and CG3=0; the DEG2 side reports Version 1
    and CG3=1.
  - Sideband LINK_CONFIGURATION (0x0c): host 03 d3 03 (Gen3 bit not
    set), DEG2 03 f3 1b (Gen3 bit set). Writing the Gen3 bit on the
    host side from Linux fails with -EIO.
  - Same result with thunderbolt.host_reset=0 and =1, and on a clean
    boot without host_reset/pcie_aspm=off.
  - The firmware exposes no UCSI device (no USBC000/PNP0CA0 in ACPI),
    so /sys/class/typec is absent and I can't see from Linux which
    mode the PD controller chose.

I'm happy to collect any other register reads or logs that would
help.

Thanks again,
James

