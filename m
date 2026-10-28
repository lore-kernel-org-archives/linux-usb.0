Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191846;
	b=oaLp2Ezj8Zhtg+MLhO+lXlnIJTxcKOgpNdrbU50Fzk+hwYcHN57F8CHWTWcd+pbLAqk6
	 MLPlE6bCHRYntTQmpLsVmvPVShtXzZe+0E3668LrUGuICELgSy6fGmC6dI0W5maibgzTu
	 tpkulU9v+pL4Pv9ZL7aLTmaefRwyEFW1bdsBJFfiObbAEuR4EEhsVxfa0rSUtwNhxwS01
	 edsFI5DmSJoZWnTK1wFLH1zQCf4yeAq9u5Ofxhtto8u6ltSFKMXMUg350Fnz4wZZjEO19
	 3z87xhst0d1TAsjz6PSthGxFgoD/Gb6/KEW/dRoK31jX2q4AgMdgohEj94D+BZ1ZnQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yvPx2xXJewvedlV4WY3CoxZ6zehy3H+Hf+g7jdJP70I=;
	b=SLfEQG0cdvrPQgxzvlQX+KU8Lw9yRtC1w05MrIb+Ak909LdpJpdViW+mKceOFHJz/0pC
	 xr3k4my2TMMjOnmlqoKVZy4HhQBZqjrle04tLthttE0l0WkPC7ohAyCNwBeH2hiRYOyHd
	 Dg5hPZRqQ+p8IF3wm/CrW11287AdeC7pBpDE98SHwrzGUx8hssMbnxOGBB6nQ8Pz0QtIK
	 MAKDKPcqOOCkNvoWW+99xsyrGM4HK2rxWjEyQZKKjzpgCQfGqH8OAOFFb9nPsjRyY4kLs
	 oLIk62YKsHND8JnPn42Wzxd1WDlFh5mh9Y9pHTs2TWyXqBaEzLcI4TaRv9ey1Ii9CtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ein3cTn+;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBE9606A31A
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 12:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FBE9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ein3cTn+
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e47347279so696360f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 05:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793191844; x=1793796644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yvPx2xXJewvedlV4WY3CoxZ6zehy3H+Hf+g7jdJP70I=;
        b=ein3cTn+yYgiVPAyZxdHK47dDdWylyq7WOPvhnu3T1dfXJ8ttWkb0p10PyZA+Ef1zq
         KRfFHxywXPaEpSe/0VvepL3WmEH5Y1yw3dTMx70AMah7B5Y7jrlk2X4Ix9owzqrj8TlB
         ZlCOMm40u4JxTIOdj3sOKMlrbOh+bg5bveTiveEiNcF2XOalDEt5FJ8eEt3osi/55EIN
         R3Jx8UR2815ifrum8fOeMys9kuNno4Z3eGDeYgRD4UsDK1qlG/1cHo1bHt9dXNhrjIHe
         zvNwYuIf5FaRIeGwnQN2/qjvDaU0fuVbOgOqP4mQYAipqM6YdWHa45QsTc3pibRgV7e5
         cZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191844; x=1793796644;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yvPx2xXJewvedlV4WY3CoxZ6zehy3H+Hf+g7jdJP70I=;
        b=wJ7kQVFTDwizUdGF7X2anZRsij3y206rOLOkOIeuSK5DkODjm9fkkKLh3J9+3UaFK8
         OQ9WM0L0zIGRdCgcHmhWlNYq086bB9eEJ6HmkVjVYlySSz02N+Xd33ySxxHSP17DJJAd
         lD0XqR4eiEqk0Jm9x2H3l1jz7CW8BJXdndLC2foW67jLKHRwM9/K7BhgGkNcNKWNGm/y
         chDZpl27sxBoVuLQTBQONEP1H7jzvStAP+DIUQvVr/29g9FiYWLeJPol4yTU3wP1WJJf
         YRPldNnBPZMBWxm1wXHaUZ/3Ihz3Ke+fNkkINmQfrQGUUEFOQU17msnH/hr+aY1qJlAa
         3oRg==
X-Forwarded-Encrypted: i=1; AKwUvBx3q+POMN1l8A1KmYlfkPRoAk24gDvYKjwHvfOvepGkRh5DiLwht/gxqkk+Xnd0kXyoN4LhoWxFqs8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5Dkb9qmD1oedmtQVOXKzHjUsBogXwcKAVaHp0zXWIHRJaH5YO
	jtrt+Z2wfJndWNUKspX+/nwFMHq7357f/4NC85dcAKm/PgsJB5MHBsfxsxaRrB/U12VZFOzOgVG
	orbSt
X-Gm-Gg: AYBFou2FGjoWmNbk1NOy47QhwwdBsPR/OYKusiVAlWuuUD79NQ1vx/Y/fgs8wwBBET+
	IT0EbLRJpVCwRgdfJv9nGAxxiTXgEfVo6j3VC53z9JCRa8AImuKa7DZo2shcMrIoT4Q+LTeslDY
	wEwI2DDUFPjLD971Kpg2d30e1OVrzk+EJunucrUNZIotumvhbo1Nq5zy1KklWkUCNAsli4aBBkR
	nexfyabo8MSbzlQSMIsNftOuDNCWu4diTInz1Nu5b7c383vwAzzs6Ne77viYbKaOanxoy/EiCxB
	rYY786SlawImFAahiJEULXuc4Njmq49luQzp3gGsDeCUuqI7yB2d6I2Rc4JA/08/qbtAQg4rw3d
	rkBMhOBbk2Zw7q0yGmv5PvJ5G++ft8ZiJa9gZ/xAqrTWnGwzwv7vnNZgyByvOnvONl3ZKTB0qJ+
	bahMf+Rqq8duomL6Sse5aRoT5TxYtFKD+nG76ReUip+Y02Lp9ASxqtgzEElsvg0Njc99iKN4inu
	vAWNHdR3BaQ6dvmEiTcAIMrgp4//UkPgXfzt7YOyNom8ubGkRVg+qEL+PzufhpLkq2qTpjtNojl
	U6x8o+S18yfCo+Ns/WD/EAkLOwTtV6ihlR64mXE2nCvB/oDufHkTiR3EE0ut1MYhko/N
X-Received: by 2002:a05:6000:1608:b0:48d:f855:d1e0 with SMTP id ffacd0b85a97d-48e5d5eb61fmr3375821f8f.57.1793191844387;
        Wed, 28 Oct 2026 05:50:44 -0700 (PDT)
Received: from ?IPV6:2001:a61:13b5:e001:5d05:908:ac82:a3a1? ([2001:a61:13b5:e001:5d05:908:ac82:a3a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f387sm28249255f8f.4.2026.10.28.05.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:50:44 -0700 (PDT)
Message-ID: <8b4be460-0fb5-483d-9e46-f5be0f99c3e5@suse.com>
Date: Wed, 28 Oct 2026 13:50:43 +0100
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
Subject: Re: [PATCH v3 2/2] usb: uas: add US_FL_QDEPTH_075 quirk to cap queue
 depth at probe time
To: Luca Cecchi <luca.cecchi.info@gmail.com>, linux-usb@vger.kernel.org
Cc: linux-scsi@vger.kernel.org, stern@rowland.harvard.edu
References: <20261009080341.295646-1-luca.cecchi.info@gmail.com>
 <20261009081225.304319-1-luca.cecchi.info@gmail.com>
 <20261009081225.304319-2-luca.cecchi.info@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261009081225.304319-2-luca.cecchi.info@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09.10.26 10:12, Luca Cecchi wrote:
> The previous patch in this series ("usb: uas: implement
> .change_queue_depth to allow per-device queue depth override") lets
> userspace lower a device's queue depth via the standard sysfs
> attribute, but only after udev has had a chance to act. That still
> leaves a window between probe and udev's write where the device runs
> at the full default depth.
> 
> This adds US_FL_QDEPTH_075: it caps can_queue to 3/4 of the device's
> reported maximum directly in uas_probe(), closing that window for
> devices that need it. Applied here to the Lexar ES3 enclosure
> (21c4:0003) from the previous patch.
> 
> v3: Sashiko AI review found two real issues in v2 (first version of
>      this patch, sent alongside v2 of patch 1), both fixed:
> 
>      - [High] US_FL_QDEPTH_075 is bit 32 (0x100000000ULL - all 32 bits
>        below it are already allocated upstream). UNUSUAL_DEV()'s
>        driver_info field is kernel_ulong_t, i.e. a 32-bit unsigned
>        long on 32-bit arches - storing this flag there would silently
>        truncate to 0 at compile time, disabling the quirk on 32-bit
>        kernels with no warning. Confirmed by checking
>        include/linux/mod_devicetable.h's usb_device_id definition.
> 
>        Fix: dropped the UNUSUAL_DEV() table entry for the Lexar device
>        entirely. uas-detect.h's uas_use_uas_driver() already has
>        precedent for exactly this situation - the ASMedia/Seagate/
>        HIKSEMI checks there match idVendor/idProduct directly and OR
>        the flag into a local u64 variable, never touching driver_info.
>        Added the Lexar check the same way. devinfo->flags itself is a
>        plain u64 with no 32-bit-platform narrowing anywhere in that
>        path, so this sidesteps the truncation entirely.
> 
>      - [Medium] the 3/4 cap in uas_probe() unconditionally overwrote
>        can_queue, which could raise it instead of capping it for
>        devices with a small qdepth (e.g. qdepth=4: the existing
>        default is qdepth-2=2, but (4*3)/4=3 is larger, defeating the
>        point of a cap). Fixed with min_t() against the existing
>        qdepth-2 value - this quirk may now only lower can_queue, never
>        raise it.
> 
>      Re-validated on bare metal with the same Lexar ES3 unit after the
>      drive turned out to have been thermally stressed from several
>      hours of back-to-back testing (confirmed by reproducing the same
>      command-timeout/reset behaviour on Windows with a completely
>      different driver stack, UASPStor - ruling out the driver/patch as
>      the cause). After letting the drive rest:
> 
>      - Confirmed the quirk applies on its own at probe time
>        (queue_depth=24) even with the udev rule from the previous
>        patch disabled, so it isn't just masking a udev race.
>      - Two 6-minute runs of the original load test (24 sync writers,
>        randwrite, 64KiB, direct=1): 840-843MB/s, zero
>        uas_eh_abort_handler/uas_eh_host_reset_handler events.
>      - Same test run concurrently with a second USB flash drive under
>        load on the same controller: no effect on throughput or
>        stability.
>      - Unplugged/replugged the drive mid-load: in-flight commands were
>        cleaned up correctly (uas_zap_pending, no hang), the device
>        re-enumerated as SuperSpeed, uas re-bound, and the quirk
>        re-applied queue_depth=24 on the new probe without any help
>        from udev.
>      - Mixed 70/30 read/write load: 614MB/s read + 263MB/s write, zero
>        events.
> 
> Signed-off-by: Luca Cecchi <luca.cecchi.info@gmail.com>Signed-off-by: Oliver Neukum <oneukum@suse.com>
