Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794840174;
	b=YLMtp+zUjEo2ri3Dz6qxy3MzrMsLLPj9TnrLuYaNlcVoLqMaL/SnmcYz0gfSDgdenb9b
	 Z9UHmZ7c+ut7HV1A4OFITrqAGgONhR7YhiUvoykThXh9t07J5484BiMrioL3wuwCA3OJN
	 RMoYrXzHD+LieeiMQ8s57fmzCp8zzs7YwT9luUL72S2q+9JmIXUGOu0nuOOwA3tVCcirI
	 uMb/lVvDF/yHWgiacciKEeXsEj0tQE4jgztJyGPVoZheCA4gSYSgUf97uEyzrGsw042se
	 aBOQJ3i+4ZqVBWuXcJtXCRUoC4duL8p2Kf5vD012RIfrpLtjTRXNeeWLABiRc8j1Lyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=qzyPP5LxbXpQymIi95hnJxB+0hk3X0lP/7iFm6/rL4k=;
	b=3EsMjdaEOKPVSqj0RfMts8RGsPejrp2cFpW5kJg7anW8zN+2tNgQe16WrWoZKQ0KC8Ex
	 uC7PHrUf5gVKcMpXnwU6wlk4JukSoZt9b1jd08llt+hHfjnFdA8aeGpSiC+G5BftxjpN6
	 ArAj0g7nrR3Xjb67VFB/3bSezIc3SCZLqDtR00xMzaTvmyR5s4zRWKNc/Magq5pGEgxDp
	 yPREL6dY+/d79Ik7q71JeP3KXPqd8GO0FuKQd8NAiYfaXrbit0HUmET5MXuq5fmTOttWA
	 1ehTP5JaDaFq9mpqyvzLQTwk+RtpD6ifupP/vFB6X5672Q6okyd9Iotp+eGKwt542pg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AuZfZ0qz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84AE606A31C
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 14:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C84AE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AuZfZ0qz
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-37071c0f42aso5195506eec.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 06:42:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794840173; cv=none;
        d=google.com; s=arc-20260327;
        b=scS3G6KZMWdROosWzYu02AlKItaqPxS3g0Eq5rlfWwm9Mnajp/8qD2Q/Uf/Nn37RRq
         kXYPDHnyVbMb1mNvY79TMZyYBmBSTklRG3LSZILnurM6RiYNnTCjXY5do3S3oKgh7rDZ
         E/098B5xQhlnVcP+veT5t++Hb0WOn1PjkU5H3ZEeh2vRe54UEBdBl+1O9A/ZVhFU7kWD
         gZlqcgkHQxa0QBU68buwB8Shpkhg08LYnkbUzylhDFJOnwA2eA+0gs+JtXBZwlMaoeRk
         iOgKxm5nyE0A8dW1qmr83jSdvP7YpF0X5MAxf9dyfVGoSLv4yS2hRlOtUnRQ0oMysNhm
         zOdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=qzyPP5LxbXpQymIi95hnJxB+0hk3X0lP/7iFm6/rL4k=;
        fh=VimqKRrJCN9rdcfuq5onff2+63396vNbthBTDDSyxg0=;
        b=GG/6NOjYX5yropKPKaGCVld1QC0cqVcA7oamaBtU2yKs6ZOspy1cH9S3k//8Fqwzsp
         JLTycK2knnoItZeJ9cXDtH8h4Y5FEs6WfosUXez3gS7K96LKBLBsEPTOReceNtySh4Cc
         VuX39bpX0YgAO9kRHSNOMiFhdnNCgDaCUEiVIzuaVpfqLN3ZjS5+I3vFsS90tGwR+ldP
         iqJRO3GBvbnUCnQYgWK7f8Zp/cG1XQdDHYqK3ULh30OnnX8OyEUbRLF0Vfn/bolu4t8B
         6CV7nvayPVyOqOyD5iXyToPg0yVleoHN4FLH3/sy1cFw2LB1E3UEWYwAvWRTbpH48j6r
         Gf9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794840173; x=1795444973; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qzyPP5LxbXpQymIi95hnJxB+0hk3X0lP/7iFm6/rL4k=;
        b=AuZfZ0qzlWxvIj2YnvqfkNuOrdOBxfw4tolLKF4PmPpL0QidhxXfDt/eNC+adeitH6
         9IH9l7oRCrrqYdx4GW4N94oBxv0PoW7IJhf/4LhzG1DSQ6J+EnkcPMQJ+/HM2q/3vgd7
         myyn1eB85HXmTUsZFmDKrODfVr6cTgH9CwbNKuNSAcRhzOzMaqHhtKalzqlBLERxyP2u
         ZpHfhxSEiE9kjLIVAdTDJs2Le3V9SVZ5J9VJAUUfR8l0Douh+gIO1pkEq58Xj2NIKM/0
         e+Ib6/AY7n3TMGl2nHiwvFikn15zTRpGdZbmurgQBcVS6K+7rxYmVHYGZ4deOTwrcOW7
         XZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840173; x=1795444973;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qzyPP5LxbXpQymIi95hnJxB+0hk3X0lP/7iFm6/rL4k=;
        b=iUmZ3qGLw8INeXcqaFLmjiwijDfy6MajU/8SU/0nW9BFajdor5NHJF4kVn5d2EJ1bS
         gEXMfaCV7DRDarNCmKLGcHiKBqVX48TmDp1RHLExVT1Ke3KwQcJsF7jGDW504QjmiwKL
         2rajqRro5kONBZdcRxJDSYq50ZpyVqb+EtqZ12wVBDqaFI6jq+I9g0MVB5PhIKnyIcm+
         stK/5OZkXCg17n3k/0Mdr9IQlwte9ebBJnOUWhCvjoRJV0g7bfE35sUzaHiSiCX8k4fJ
         X+F+bo5FK8lYKnlOaQ5wbNo5u9FyNMyfl2pb9lSXYZ1rc/JqONGiiPcZ5st8oOHyYI+n
         8EsA==
X-Gm-Message-State: APuU4Z/h9YMaNPf3vHajKOY/uBd6O9jUByqc3MPwsf2144TFWQMwCTIm
	UZDwK0PU2cGPCqjqgccQwwpfIGLSiGY5TN6qxj8mOTF0PhmOXQl17nywFleQqyfMiVJs79Y3FHF
	593h5h9mwN+zCADOOmN4hrXC6lMzK8vWAyW0Fgfg=
X-Gm-Gg: AZFdTZeYvY+1DwQEfysFBzy5/nlE+8fAJAbB/MdRaT6hfXSNnHoQB6u0nBOO305UDEB
	ruFLqI8yqIevxwtuFU2K//UdUW9Z9uNDTITvI2XIIaZQ0qoCY2rT8jhxpped5vwDoksw346KfUA
	X7b44xQNfHtLrF+n0Qfhy/ZiHEumbSaVjDJly6UXVRNoTYYZytUT1prvLixh7BFfQ5ym8w+l8n0
	BEp4Nw9ZA5hijsbXdrr60wjHmkJOBWQOwo5/6tT/rJpLGcA6FRzojDI1PTgROjjTK9ZYonFRCZu
	pRoABRbio72PprMlWd7cJeX7MNG8Q1zV4TU+J894LSG8meICEon8JXHr1aap0oZqCj/SwRDjAOO
	A+4FqzOvcSnjheuIISJ1GYhTV1AJkAxi0BbVQfHN6YZnqjxuJaGW94qcaFri+Y7ErZ9W7mwwHkP
	b4iy/Zm1mGl/SPP7Y9Pki0iXB2lXr5xQJthmgHlVP5cXnBHGmsS9b/lPxxlNIaLSr2szH0
X-Received: by 2002:a05:7301:1a05:b0:369:f035:661 with SMTP id
 5a478bee46e88-37967315a1emr9453505eec.15.1794840172444; Mon, 16 Nov 2026
 06:42:52 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Davide Maglio <dmaglio@gmail.com>
Date: Mon, 16 Nov 2026 15:42:16 +0100
X-Gm-Features: Aa3M54odKxrtYBHbnD-jj3Cd7gZlR1FdynXjQbMnG6AYvuRKHO-BKM-cbS_8KHs
Message-ID: <CACnbCLHCVhMEc5iM3pDpmikWkm13wGrPLJdq8S-grH9ny9vnbQ@mail.gmail.com>
Subject: ucsi_acpi: USBC000 (PNP0CA0) present on HP ZBook Firefly 14 G11 but
 no driver binds, /sys/class/typec empty
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On an HP ZBook Firefly 14 inch G11 (Intel Core Ultra 7 155H) running Linux 7.3.3
(Fedora 45, 7.3.3-300.fc45.x86_64), the UCSI ACPI device is exposed by the
firmware but no Type-C ports are registered, so there is no Type-C or USB PD
information in sysfs.

Hardware / firmware
- System: HP ZBook Firefly 14 inch G11 Mobile Workstation PC (SBKPFV3)
- BIOS: W70 Ver. 01.10.00 (06/12/2026). "fwupdmgr get-updates" reports no newer
  system firmware or "USB-C Controller" update.
- CPU: Intel Core Ultra 7 155H

What I see
- ACPI device USBC000:00 exists, path \_SB_.UBTC, _STA status 15 (present,
  enabled, functioning). The platform device modalias is
  acpi:USBC000:PNP0CA0:.
- ucsi_acpi and typec_ucsi are loaded (lsmod), plus typec and thunderbolt.
- /sys/bus/platform/devices/USBC000:00/driver does not exist: no
driver is bound.
  waiting_for_supplier is 0, so it is not a deferred probe.
- /sys/class/typec/ is empty (0 ports). /sys/class/usb_power_delivery/ is empty.
- "dmesg | grep -i -E 'ucsi|typec'" prints nothing (only the SSDT lines
  UcsiAcpi / UcsiCntr from ACPI table loading appear in the boot log).
- AC/online = 1 and the battery reports charge state correctly, but there is no
  way to read the negotiated PD contract.

Expected
Type-C ports registered by ucsi_acpi, with partner and PD source capabilities
visible under /sys/class/typec and /sys/class/usb_power_delivery, as on other
UCSI laptops.

Question
Is this a known issue for this model or platform? The probe appears to fail
silently with no log message. Is there a quirk or a different backend expected
here (for example, is the Type-C control handled by a different controller or by
firmware outside UCSI)? I can run any debug build, dynamic debug, or provide an
ACPI dump (acpidump/iasl of the DSDT/SSDT) if that helps.

Dynamic debug
I unloaded both modules (modprobe -r ucsi_acpi typec_ucsi), enabled
dynamic debug
with "module ucsi_acpi +p; module typec_ucsi +p" in
/sys/kernel/debug/dynamic_debug/control, then ran "modprobe ucsi_acpi". dmesg
shows no ucsi_acpi or typec_ucsi message at all after the reload (only unrelated
USB and evdi lines), and USBC000:00 still has no driver bound. So the
probe seems
to return before reaching any dev_dbg/dev_err call, for example a silent -ENODEV
on a failed check at the start of ucsi_acpi_probe(). I can send the DSDT/SSDT
dump if useful.

Thanks,
Davide Maglio <dmaglio@gmail.com>
