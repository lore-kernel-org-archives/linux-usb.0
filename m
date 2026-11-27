Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785901;
	b=zIab6+zOdlK3IMJQyDPMDW2Kc4CuTCiftTZ7DmqLCAPd8CqqIQT9Ll3WUgve8pn+C00b
	 jSjYVb/fPs98Iwgi47S/A8PJWALGLuFzg4hNIpY4TKcXbg0Dtdfk7xVYzofaYryeBSmIZ
	 v9/AxWP4s3gZ83Qv6RP6sY+4Iu7SqkAi++Q9RKB7glgt7hWGWqhEOHlUFHzz6SKNIFZEv
	 iskRnsKq/uvSs7zBVNSntbRPYgxxwySKcXhklvWVkPGY7F1/EjDVQK746XJ4am61Yhfvl
	 Ocks3zZmEpx8N4nCP/lJ7oUJCrf3DZvk5PN/ZeSCNTNralKhKICTIm2aVPncY3efy7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EaXmFR9xiZjm/bYgzq3Og9ZEDuO5qEafv1Kq0+2IVmg=;
	b=nCyhd4jx2NQx2/3X3eeXtPoCHA2HE1d4Y/vdrCb7X79S7YA4ujtTIMENMh6CkErdYYvk
	 aLs0j9NaMry6fp9nnBHC22ANze61yywAoAHQTbwOYut7BlRI8JMS/jYtIEgqnbjJjw/hX
	 52/2Pibk9FGVjaq7VSoo0GUeIiaKiQDvt+buSLmpVnH8vsMwbeIFyw9FnD97iUeeJ/gTv
	 anAi6oWFbxqRuivbikLTmwLCR/lRJM/yywRezzA/ri5rN6MHq9VWYzxmy+VP4Xow9xo8w
	 oqY68CB+T4Ow+durz7S5PZVBCocHcHEPPUyPFZuAoGUrBRnJkp2+VFj8SL2O7Az3XjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJyJWX+z;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0028B606A31F
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 13:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0028B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJyJWX+z
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso17208308eec.0
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 05:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795785900; x=1796390700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EaXmFR9xiZjm/bYgzq3Og9ZEDuO5qEafv1Kq0+2IVmg=;
        b=UJyJWX+zGA5LzPEZFBmS3nTBbpkbcXcfLZi7A2mPmYVAMDmVViSKq1poWGzSXwi3yv
         Vq4KX+pIXg/T/gFVvkV2vU0FwhJp/qCzRLyufG6UzXENBkGtp2qMWL7qaO4925zhFyt3
         DS+ehIzD1dec2zdBL92CCYqXGDb75aI2hmh5M35at1cm/bU4f2qfEKD8lTiZGp2KG1Gl
         6DimH7IMwTS/XApsHETVQVoECpB/MkB+lCwxvCwAkp7fahkYLMCaLElsRCrb+AXfDwHQ
         cFD8uTnAz2M2/0mhBsHNiDa7VdYswg9wN2MEMF/diZtYHvSJr5nWYFC2NLye+r6CenpE
         pT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785900; x=1796390700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EaXmFR9xiZjm/bYgzq3Og9ZEDuO5qEafv1Kq0+2IVmg=;
        b=A/mDr/l1ccacj5NVrG00OXgKj7Qs+jYxhTgKxtWXR58FaVKJsy5c30fRq8cLrXun+f
         i5IIc2Y4/dqda3q2ZTRdUzXwArBzJ9hfjhMSSBgxWzyhjUbLlyh359+pTwxVUGPvasBs
         G0HrBMMdG+dQ7IpyKgAOMLPIpieiNg5Ag/F0A/K+uIeuP3fINiu/LbJIecdZVcHo0qIg
         5cHYa41Rth1sTRibeRtDHWEaWmJ4CUEcLAj4+3qkyeiKmtZDboiK0rY1uAuCTZMGu/VD
         zaBJ0/WRBcnEo/+OqRaQiaKyr+vVnrYwtFfQPTvkaLDMfUnTDOGgRzTJX9HgXZ7e9f2X
         FG5Q==
X-Forwarded-Encrypted: i=1; AL+hErG99odXCuhJ5kXq7iHbc4PFXTyE9Npwq3QmJtZGNxR7DsX1+PpSiI4CDNRSZo2bejTRbbwgk9WsVF4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ibAhiBgbaRitPTSCOVWmZs8tHoF9sKX4x95ipvkrBBM7hfy6u
	AWyG2k45yBsXTvMWivynJfpMHRFIP5I0xsPCmUrjUTNO3ggRdj1tsugm
X-Gm-Gg: AZFdTZf3fiWZHaLtEuiurHiw5GKkfx92PtCZwhzIxqmaT2RjbJiqKe9XHxZUkrdXo0i
	bW59hYdO3GlE/7WYqEjpTJcP281k3vpN7rlxPgJdHnSfH+Kl1aKHYv0gr7TZ6aUEJ3T6AW4GLi2
	B7V9SW+tD7hucGZpEazrInryerMIJpEPMp6YPdTo7XMFT6A+HaNeHx1Ntt2f7bBAvBBu9hlP7Hg
	xW8H8vAAPvppntURpY+6cvvQ0dYFDBmOEa7LF+qMhMHY1mjOcFrtXfhKqz/4JrNoU4GuwF8hwEc
	IWk1MQskHRPuSU4f3Q+LejHtw1MMg8EYvzMkpQo4m60TEn0WOcpLIrh1QL4aNMfUbFqyLJ0abWy
	G5a+Q6zzAKSIL3bGLOKnPflWRAvYvl977n5Po+m0KpoJPWQbrv48YyOB3P1L2mVeqR1BEAHJsMF
	o2iudTZWjqM3BXAzeIXgVG0c0BN37QbsJzQOrABGAjOf3JqsbTu95SktSCmRQrPf1gT+954E88Z
	B0lz4VC1E4T74zuaB9ke/fhV2ue2AArh25dyg+VNAZY1zSPDz94txXCtmULsD3qQhzTgeoI3dJB
	2ODnWgHimg8dC5bz9UV32mlvJVrHMLJJPf/w01ckPSOwzgCNy4FmZvKAAwuY54Idy46oe9fTIA=
	=
X-Received: by 2002:a05:7301:c005:b0:386:a0c0:5e59 with SMTP id 5a478bee46e88-386a0c0757fmr21634002eec.20.1795785900079;
        Fri, 27 Nov 2026 05:25:00 -0800 (PST)
Received: from 192.168.1.36 ([2402:a00:163:2ce9:b15c:e4fe:6de1:494a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm59082431eec.1.2026.11.27.05.24.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 05:24:59 -0800 (PST)
From: Ajit Singh <blfizzyy@gmail.com>
To: romain.gantois@bootlin.com
Cc: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heikki.krogerus@linux.intel.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v3 0/2] usb: typec: mux: tusb1046: Support no-hpd
Date: Fri, 27 Nov 2026 18:54:47 +0530
Message-ID: <20261127132449.89081-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On boards where the TUSB1046 HPD_IN pin has no usable HPD signal,
configure the device to treat HPD_IN as asserted while DisplayPort
Alt Mode is active. Describe this with no-hpd.

Changes in v3:
- Describe only the hardware condition in the binding, as requested
  by Romain Gantois.
- Carry Romain's Reviewed-by tag on the driver patch.

Changes in v2:
- Use no-hpd instead of ti,hpd-in-override, as suggested by Rob Herring.

Ajit Singh (2):
  dt-bindings: usb: ti,tusb1046: Document no-hpd
  usb: typec: mux: tusb1046: Support no-hpd

 .../devicetree/bindings/usb/ti,tusb1046.yaml        |  5 +++++
 drivers/usb/typec/mux/tusb1046.c                    | 13 +++++++++++++
 2 files changed, 18 insertions(+)

-- 
2.50.1 (Apple Git-155)

