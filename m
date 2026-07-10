Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B67419302
	for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 11:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783682729; cv=pass; b=guq74pG6Q1ByxaM96mulwAfI4XZs0UqtRMQ94vZtqPXJHz4Xh8Id754BR7oowt75USsBp+NI+d2MPYCpJrO3ToS81TWwWfMLvd2HUvdeQYUt0caV0Qyhth4GImHlHfnVmpWbMbZk93qpFgbAxDd1AQNNHchTkFDzRSks4RQ5n6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783682729; c=relaxed/simple;
	bh=a41howGgbsWC9o4SKSYzlb88s9e2x1q7i4JrOoChpj0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=bh7rH9bZ8jGqdVqb9wgL82HsHtl5ug960yJX8AagkdpXnkauGZmyUtTE2GOWY8CZ0ljZg0mC0tzuSYM/T8jK/EHAvcUeTlsq/T73b/Lrw78Z0gq7/HUut3i2aBZldkL8+mpiJD+5kjVZIP+99NrnmEQSb5tyuWHr6GoFMwcgKf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=phfeK+jf; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="phfeK+jf"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c160d8760e0so3990866b.0
        for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 04:25:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783682720; cv=none;
        d=google.com; s=arc-20260327;
        b=CIYQue6r5XY7qjbO6unbTN55dc3AjIhys5pRv+DcOh6lIyKlQEo78WLmECuFKphxnp
         JUPpg8CItujqmSXUJF30MH+1ILhXm0JJYLz7TO+qSsrr2/zAyxj2iNNs7uE7kHJgPF8+
         TpM6IpN7csHlZ8/QN/QqzuiSABglqHGljj5p5Jv4p51Pgvyquzq/YV1ZoFUYi4O/zlFC
         JCmZ71J7fwnJkg+8yrA39Ck/KM+qLpjO2Vk3feE7wFok2kvU/XPldyXMNBIXfkbIVSiZ
         r3xNVH4mP9Y5a62ggWu6bmkKVYtRZDUeZL+CIMKTqXI07FE0UfYledT2+KB9eQD+HqrB
         3sHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=lBPAJJ670r8RPq60lvSyS4rhJVcLfGTo/ShXwPeFcFs=;
        fh=HXYDs94KzwTSsUf1O3tCI1GSm/xkj2EYYWY1hO6y3Vo=;
        b=Eyqby32fdVc4Dqv0PNVKdFD4SLIHfb3heJA+C1gPt+6sYk/mFX3vTa0VKAsBN+xSgd
         dSLu+EguuwQXPsP4kMvxDANQAlGmX9phQWquHH/oLk3pCrzuhMsr97vkGTI3rb7jiQgO
         rn4aYAqmSHY/8QzCmTvdo4crtzC56UcqgISJ8t4ddHQ9IvMH59SRkegAOLV6dcHjjj15
         BB4CyRgfNK6gDP/FxfwYBihe7uQ6MmirG3vyoLGP/nY9b5ubsnlcb6CrPtz2WN8qXIdY
         NEfwTs4/JN0EAJkgK6npTBHiS6uUln6196HCbVGzMkvofBP7RDi2CKzOHOWbE2Pvsobp
         1cTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783682720; x=1784287520; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lBPAJJ670r8RPq60lvSyS4rhJVcLfGTo/ShXwPeFcFs=;
        b=phfeK+jfhdsnPdNQCSchCw1wkoiKv/nZFqYBtPq75J2irN5/CQLE/OY0ieDcxm8u1a
         SreirZbQ84INZmx0cJ7S36biUDNnxTSg6XOWfLGzp3NA/kKTv4jQOk9XnCpGrX43uRu+
         Oh+2+3sfnTjtL6RVTBVuE6f0tUV8Gm9eAR7wv2JDznW3DMiftVu1b8O5iQ0ygGgdRqYX
         hVvC6Nv33GegaV8knvDCgJPep7x5mBio4FFhei84/aIICxOYZLOKnTX4FAjs9E7T7nps
         IKQjo+nhKnGDJfS3s/PndhHZM2fIOet0OUmnsg/A9HlZPU66yMcwI6zBkpr7hCajIwPK
         b9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783682720; x=1784287520;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lBPAJJ670r8RPq60lvSyS4rhJVcLfGTo/ShXwPeFcFs=;
        b=QyTw4zZoewqHBa8oMGVaIQXDAEWMv+Wy6nl7UJnJLbsIK3R9tgiUnfPw3igWjcUM+2
         RxLd3DZD143WVUiP/kZgUvI2S4d42+MjLR+th41fqz99pi78sbMx3XWspZOHJeEKqWUm
         3brLhhr6kv51QDebp8Sq8w2oiJ1XvSAZGRxAzlIhgUQSVnrCp08rD30XQB0ATQTLaq6E
         JuJ40N74cDMJzL5r5XnMVcWqy5HO5ZXu0Id3Gw5QTclzldmcLVBCu35j2mJEXY59XhV3
         UPhQGjePtYLE8Vai903eTWS2/Xr5uku+D2ldpK7CDWmVNcId1iN10VG+ojvSzmx0MEwp
         +/jg==
X-Gm-Message-State: AOJu0Yz21wHlrObcIQHzOeOt1A6VqrfAt3YxhLEDc463jIA2OakWdmxr
	VAghxBfU2qfR/renFUlD/ZCEb3vuu0NMkErvhED7LdyMkoFv2EpiNJwjOOpanq4fJpg1b8Ud+CT
	Q0kZkZ3xbb/GP9t8ImeM9ShLboNsigyj8q3I=
X-Gm-Gg: AfdE7cm6QlHrFArTCy90NR3Yq4DDCJQJLSlwHyqkuRjKt/EegIRMKhX5NegwFWYYa+J
	sOok+I1PYjwDaDNblg5ZSTeXv9lVZY7tqG65eA0YQkNoJ165fIdqB1ZrilViu7rjywEfgX6aj8z
	4cELtkgy9dbLADXsFpxv3R8DqFdthwe/h+rBo1JRHD0TIDd77OEkRAnLBdJvtpQFTJML1DIWl64
	rzH78zWcDD9MfUWwdAFREbEDtDt1cr9SiEQp6KzlbRkoLF269qjZCVsn9ST6Zw1H+zMwcoh
X-Received: by 2002:a05:6402:3507:b0:697:5664:4c12 with SMTP id
 4fb4d7f45d1cf-69b8e3bf634mr1987738a12.3.1783682719527; Fri, 10 Jul 2026
 04:25:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Trabajos Iafast <trabajosiafast@gmail.com>
Date: Fri, 10 Jul 2026 06:25:08 -0500
X-Gm-Features: AVVi8Cfg6V5zsK3Q-2F08yLPpf5IvBkG-TtOz5jeJuYURWjBuYmYToeONk8-LtI
Message-ID: <CADvEaBJnc49dyCNTbe8ys4G4HhEKpMFyjm7xE74evxFodYFb-g@mail.gmail.com>
Subject: =?UTF-8?Q?UCSI=3A_no_connector_change_events_for_connector_2_on_?=
	=?UTF-8?Q?Lenovo_Legion_Pro_7_16IAX10H_=28Arrow_Lake=2DHX=29_=E2=80=94_port_functi?=
	=?UTF-8?Q?onal_in_Windows?=
To: linux-usb@vger.kernel.org
Cc: heikki.krogerus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

Hi,

I'd like to report a UCSI issue on a Lenovo Legion Pro 7 16IAX10H
(model 83F5), Intel Core Ultra 9 275HX (Arrow Lake-HX), where one of
the two side-mounted USB-C ports is non-functional under Linux (no DP
Alt Mode, no data, no hotplug detection), while working fully under
Windows 11 on the same machine (dual boot).

System:
- Kernel: 6.17.0-35-generic (Ubuntu 24.04.4)
- BIOS/EC: Q7CN78WW (latest, issue also present on Q7CN33WW)
- USB4 silicon: Intel Gen14, 8087:7ec2, firmware 15.1
- Secure Boot: disabled

Symptoms:
- /sys/class/typec shows port0 and port1. port0 works fully.
- port1 gets a partner device enumerated at boot (PD 3.0,
  supports_usb_power_delivery: yes) but number_of_alternate_modes
  stays 0 and usb_power_delivery_revision reads 0.0.
- No typec uevents are ever generated for port1 on plug/unplug
  (verified with udevadm monitor; port0 generates remove/add/change
  normally).
- typec port1 never binds to usb4_port3; the "connector" symlink
  under domain0/0-0/usb4_port3 is missing (port0 <-> usb4_port1
  binds correctly).
- dmesg is completely silent: no ucsi/PPM errors at all.

UCSI debugfs probing (/sys/kernel/debug/usb/ucsi/USBC000:00):

GET_CAPABILITY:
  0x01300300012000020000040200000144
  -> bNumConnectors = 2 (both connectors are exposed to the OS)

GET_CONNECTOR_STATUS connector 1 (working):
  0x01300300012000011304b12c405b4000
GET_CONNECTOR_STATUS connector 2 (broken):
  0x01300300012000011304b12c405b0000

The responses are identical except the Connector Status Change
field: 0x4000 (Connect Change) on connector 1, 0x0000 on connector 2,
with a monitor attached to both ports. The EC appears to report
connector 2's status when polled but never raises connection change
events for it, so the event-driven ucsi driver never processes the
port. Windows 11 (Microsoft UCSI connection manager, driver
10.0.26100.8521) handles the same port without issues, DP Alt Mode
included.

Ruled out: BIOS/EC update to latest (Q7CN78WW), EC power drain,
thunderbolt module reload, PCI remove/rescan of the USB4 NHI,
ucsi_acpi/typec_ucsi reload (port1 never rebinds), kernels 6.14 and
6.17. No retimer firmware available via LVFS for this model.

Happy to provide acpidump, full sysfs dumps, or test patches.

Best regards,
Kerly Cervantes
