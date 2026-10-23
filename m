Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.26.49.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792787264;
	b=XUUnh0HoUKm6p3EOUM1KHwn3KKKsffSHm8hfW0Zh0zTYoP5FCp7eJNPTLi2TwLN4eC+c
	 UjKPMM0xy1Q5B+0XXZWQTtPXHULJ4MRhEOw9wxm83AVKa7583/EnG95YSfC5u5LuRg4rn
	 cnwCxhqj/vw+UZFF1FA9IPtSKVPQl2ZEfI+9ljx/apPZUkOJ7NkxOKbZKg767thQ1AQnw
	 w2OpVvJPwfP2v42zKi6QfJ3rIS3z5toFDJztVsEUw4pFda/zDbbb2bf4713vpDTHBnkex
	 9o8yqCak/6KX+7XpFr8Dvtm3wlVEdmOIR6lSen24GuBzM32xee1HWsEbaIDAMus4uOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792787264;
	h=DMARC-Filter:Received:Received:X-Authenticated-Sender-Id:Message-ID:
	 Date:MIME-Version:User-Agent:To:Cc:References:Subject:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=k8S9bI2ki4Cz/oNV05CKH3C3Jxex+Im4+Xzk6EvyVTA=;
	b=V9ozHBKjCWNedzJ2lnpKouMSC7WmKMIb/Edh31BjSgNrSImkYZjAM017hQ7cCSfmiyjS
	 VtKJP//TICRZoGwYoWfVVFNEnZLoJdwhz6CfkUhj18zvPcDUdPgYJc2LIPOsk3W89jpTv
	 6/uRkMcGpqqPH4jzq5bxhq8hfKSQ2bEFAg9bMlehy+20d3JWRJ+DK0UixoKM0dO9PDI8c
	 glSbh+1GivkTn48YRpObMbvuvTYL0b3QJss99RSKhUgObMkKZCqZrJQ+PYS/WHDWeXkx1
	 hTbX9CPyd9GA+NfxZCmygxN9y309hu9Tq8KnC+A2iP9/ttIRscuLX+LLSEATAdYqqYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=semprevivo.ch;
	spf=pass smtp.mailfrom=semprevivo.ch;
	arc=none smtp.remote-ip=217.26.49.196
Received: from mxout022.mail.hostpoint.ch (mxout022.mail.hostpoint.ch [217.26.49.196])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26084606A31D
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 20:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26084606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=semprevivo.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=semprevivo.ch
Received: from asmtp013.mail.hostpoint.internal ([10.4.1.186] helo=asmtp013.mail.hostpoint.ch)
	by mxout013.mail.hostpoint.ch with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5 (FreeBSD))
	(envelope-from <rodolfo@semprevivo.ch>)
	id 1xKLrS-00000000HYt-12Bo;
	Fri, 23 Oct 2026 22:27:34 +0200
Received: from [157.143.51.59] (helo=[192.168.1.164])
	by asmtp013.mail.hostpoint.ch with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5 (FreeBSD))
	(envelope-from <rodolfo@semprevivo.ch>)
	id 1xKLrS-00000000OEN-0Ozm;
	Fri, 23 Oct 2026 22:27:34 +0200
X-Authenticated-Sender-Id: rodolfo@semprevivo.ch
Message-ID: <91bd4409-8121-4919-8556-8b49ec8f9304@semprevivo.ch>
Date: Fri, 23 Oct 2026 22:27:32 +0200
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
To: linux-usb@vger.kernel.org
Cc: mathias.nyman@linux.intel.com, heikki.krogerus@linux.intel.com,
 intel-xe@lists.freedesktop.org
References: <ef5ba6ff-ed50-4bb6-ae6d-fb11f0a47954@semprevivo.ch>
Subject: =?UTF-8?Q?Panther_Lake_UCSI=3A_PPM_forces_DP_alt_mode_pin_assignmen?=
 =?UTF-8?Q?t_D_=282_lanes=29_for_C/E-only_partner=2C_no_4K60_=28was=3A_=5BBU?=
 =?UTF-8?Q?G=5D_Type-C_Subsystem_xHCI_=288086=3Ae331=2C_Panther_Lake=29_?=
 =?UTF-8?Q?=E2=80=94_repeated_err_-71_/_port_reset_failures_under_sustained_?=
 =?UTF-8?Q?DP+HID_load=29?=
Content-Language: en-US
From: Rodolfo Semprevivo <rodolfo@semprevivo.ch>
In-Reply-To: <ef5ba6ff-ed50-4bb6-ae6d-fb11f0a47954@semprevivo.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

follow-up to my report below, with a corrected analysis. The xHCI was
the wrong suspect: the -71 errors come from the monitor's internal USB
2.0 hub, which sits on the standalone xHCI (8086:e37d, 00:14.0), not on
8086:e331. They only appear because the monitor resets when the DP link
fails.

Root cause: on the left TB4 port the PPM/EC configures DP alt mode with
pin assignment D (2 lanes), although the monitor only advertises C and E:

   port0-partner.0: svid ff01, active yes, vdo 0x00140045
   displayport/pin_assignment: C E   (nothing selected)
   displayport/configuration: [USB] sink
   xe: Port D/TC#1: TC port mode reset (disconnected -> dp-alt) pin 
assignment: D max lanes: 2
   xe: [LTTPR 1] Link Training passed at link rate = 540000, lane count = 2

2x HBR2 is not enough for 3840x2160@60 (594 MHz), so the picture drops
regardless of bpc/HDR. Lower resolutions at 60 Hz work. This also
explains why the dGPU route via the MUX failed identically: the lane
split is decided by the firmware, not by the GPU driver.

For comparison, an Alder Lake ASUS GU603ZW on the same kernel, with the
same monitor and cable:

   i915: Port D/TC#1: ... pin assignment: C max lanes: 4
   i915: Link Training passed at link rate = 540000, lane count = 4

and 4K60 is stable.

Linux cannot correct this. Writes to pin_assignment/configuration fail
with EOPNOTSUPP:

   typec_displayport port0-partner.0: firmware doesn't support alternate 
mode overriding
   ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-95)

So this looks like a firmware issue (reported to ASUS as well).
Questions:
1. Is the PPM choosing pin assignment D for a partner that does not
    advertise D a known issue on Panther Lake?
2. Should Linux warn about it (partner VDO lacks D but FIA reports D),
    or avoid the resulting 2-lane DSC mode?

System: ASUS ROG Zephyrus G16 GU606AX (Panther Lake, Core Ultra 9 386H),
BIOS GU606AX.304, kernel 7.3.0-4 (CachyOS), monitor ASUS ProArt
PA169CDV. Bug report: https://paste.cachyos.org/p/83e1bcf.log
Full drm.debug log available on request.

Thanks,
Rodolfo

