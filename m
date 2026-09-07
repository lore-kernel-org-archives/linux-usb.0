Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DF53F1078
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 17:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788801623; cv=none; b=HXX2IimLiRIq5EHAuAboBHuJhBV6sNNQjEmOC46alV83cblYmmMFcrYpFPFw1QXVE7Q6rUX/Ana7MPiFD9B3Xr/gvfsMdT/7HFfE89a2FaZd3/fKT7kD6k1pGss3F3Wr8RAcAdodr/grISTzY2MX2Mzd8uu4kB5+mrS9oU1NJbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788801623; c=relaxed/simple;
	bh=EoiMDFX54vQdSKxNT8k7n3wXAqYsBjK4mfbNthqKnfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CdCJ40LTB4a+czjLhTSV0QDNq3j3EQDoRh1hh7ELby26cg8lx/xIEoevcTrfln41kSgWv0nXROlJIqzYSAc95IgN5gNbUPNyqCaXrDc4NkH/l3XD6QCTstzh4+FGJJao9dPKM27m5t68/YlbHvhBrkSeh42hGrB0aa9krkIyeI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tze+E7yr; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tze+E7yr"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49d0726ccc2so14767025e9.2
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 10:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788801620; x=1789406420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZJMgJVhhPPod1olpk1LHOViEOFiWNdrhNB8qTKDSK7A=;
        b=Tze+E7yrDL3aqE4JFyvsioBwpMSrHmlGmvwkF24cXxMBUSYOwfMKdasrEQbswxQev9
         aB6WAVEyPpQ8heu5rxbEGQ/lW9ybyesb5MpU4Fq6A9VYsXwxUDpMdU1NqYpu39U2Yz0a
         lKbPpaMdtMUkTYKaZ09rmqRseml3Qsy0yd0eqCacFZ0UXUNvHKqOaDAxsIGlAguP71Jn
         9nZtyDZRBPZAw1XWuL+g5cN9Z4n+KZpH+krHS05KrbWjDcuLvOjZpNm9Dvn3JuUQMtRo
         E4/OYM8I5endIFASBGPMLfouTgZq9lnYO/WCm4R2waU2WapKQsSdVXXd6D4TyBjiBOHS
         pcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788801620; x=1789406420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZJMgJVhhPPod1olpk1LHOViEOFiWNdrhNB8qTKDSK7A=;
        b=hvwaIt5C6nKkqY5AcDN8kj5TcTWEgLkCSnEWulWq/LUk8dv/llcJGY7Bc5KCEevac1
         UYdEcCuBsRfFIPtnIJUf7XhAlIK15uwZDoKGtlQaw5Ng4Ebl+ywlproQa9PFds2KOqxN
         uqK3M2wQ79w+sOGSWlTqe8/omK5gpmwgkKwRS9UZTTHlRXc/iHgRTOIXYWWz9vSdQyFa
         Utfb33lmfyMbiVI2qju8FsMmFx/6F91rmjGt3ognefJCEWcUlY6fqEPJeBZW5lh0Sjet
         cAdrd2ETAJEFls4Sag1tUL3WX5xObLoKTqRUltrQqOInpjUcNNPhdZ8ODU/QbY9N+gLb
         uMgA==
X-Gm-Message-State: AFuF++mJMFr/C9mhPg8tY02JZyIYNJ+GBHgXHMkLW5iZK7fLaGOodmP/
	6PS/U0ytbB9MsuW76CSTLqDWhDY8tksP+ul6to2v1QZYSvRyyhljIK0hL3OH6Q==
X-Gm-Gg: AYBFou3/GUf1vNiF244jAwYDvStHJo7wF76c7nBfB0WGtwO724H7s9Fxj7UOWNFB990
	1SVlfcm//MuqvbCkUTOkvR/bW094N/Z8W/w7bb6UIOiMAt7TKrUYsqYwWNrRIq6vNXFxWjCgqMk
	T/Hz0axLBFxc4I1JNKONOEWPg6+fs6s/pJgfMDPtu/WfzIbIAEVGtaZS9Ns1oh8HAa9LLJAjOQl
	iw7+YsJ5oQG/mvLDHTfVxA2FZYny9P0rRCz2n+Yxt4uPoKfAqhhNGpj1Z5L1bhcN6ohvMIjPy6g
	2MsXWTShMxKuAEO2yHp51x2+cqkS+gAajmYxf7e3Xzdam+YBoqnW8ZeMGVYtjvwC6/sOJPukU0k
	RXjJlTXKwrymirkmgQugVYGiSP3E5+pSZsEIQI9uOT2vhtaSa3Gf0WmVZvegEd3iWaD75Wgr/oF
	arDb/h2jUe77jOk/PjkgnN7IZtfw4aVnD5trQz30jUVJTCTI/xSZEqAm1GEt3v2WN9PX2HvUA7n
	GW7kZMCPlr66MY=
X-Received: by 2002:a05:600c:1c29:b0:49d:5ff:f408 with SMTP id 5b1f17b1804b1-49d05fff5bbmr237573145e9.15.1788801619274;
        Mon, 07 Sep 2026 10:20:19 -0700 (PDT)
Received: from archlinux.tailbe3ea7.ts.net ([109.228.249.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cffdb2c40sm192662505e9.1.2026.09.07.10.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 10:20:18 -0700 (PDT)
From: Ismail Tarim <ismailtarim7@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [BUG] ucsi_acpi: unstable GET_ALTERNATE_MODES(SOP) response prevents DP Alt Mode binding on ASUS K3605ZV
Date: Mon,  7 Sep 2026 20:18:42 +0300
Message-ID: <20260907171909.1657882-1-ismailtarim7@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On an ASUS Vivobook K3605ZV (Alder Lake-P, UCSI over ACPI), USB-C
DisplayPort Alt Mode is never established on hot-plug, while attaching
the cable before boot gives a working display.

Repeated GET_ALTERNATE_MODES queries for the SOP recipient return two
different six-byte payloads in exact alternation. Under the record
layout Linux expects, these produce two distinct driver-visible failure
modes, but they may well have a single underlying ordering or
serialisation cause - I describe an alternative reading of the same
bytes below and I cannot currently decide between them.

The payload instability is reproducible through UCSI debugfs without a
patched kernel. I used a kretprobe on ucsi_send_command() only to
confirm that the CCI data length was 6 on every call.


System
------

  Machine        ASUSTeK Vivobook_ASUSLaptop K3605ZV_K3605ZV
  BIOS           K3605ZV.317, 05/12/2026
  CPU            Intel Core i7-12650H (Alder Lake-P)
  Kernel         7.2.3 (Arch), CONFIG_TYPEC_UCSI=m, CONFIG_UCSI_ACPI=m,
                 CONFIG_TYPEC_DP_ALTMODE=m
  UCSI transport ucsi_acpi, platform device USBC000:00
  Type-C port    port0, data role host, bound to usb3-port3,
                 usb2-port1 and usb4_port1 (connector_ops [thunderbolt])
  Display sink   Gigabyte M27UA (3840x2160). Connected with a cable
                 whose DisplayPort end plugs into the monitor and whose
                 USB-C end plugs into the laptop, so the laptop is the
                 DP source over USB-C.
  External DRM   all on the Intel iGPU (card1: DP-1, DP-2, HDMI-A-1)

Loaded Type-C modules: typec, typec_ucsi, ucsi_acpi, typec_displayport,
roles, thunderbolt. I can supply GET_CAPABILITY output or anything else
on request.


Symptom
-------

Hot-plugging the USB-C cable never brings up DP-1: the connector stays
"disconnected" with a 0-byte EDID and typec_displayport binds to
nothing.

In a controlled test, attaching the same cable before boot resulted in
a working 3840x2160 display. Separately, 71 retained boot journals
report DP-1 connected; those historical records do not by themselves
establish the attachment sequence for each boot.


Observation 1: the SOP payload alternates between two values
------------------------------------------------------------

Issuing the same GET_ALTERNATE_MODES(recipient=SOP, connector=1,
offset=0) repeatedly through /sys/kernel/debug/usb/ucsi/USBC000:00/
returns two payloads in strict alternation. 40 reads per inter-call
spacing, 120 reads in one continuous run, zero deviation:

  back-to-back : ABABABABABABABABABABABABABABABABABABABAB
  200 ms apart : ABABABABABABABABABABABABABABABABABABABAB
  1 s apart    : ABABABABABABABABABABABABABABABABABABABAB

  A = 01 ff 00 00 01 ff
  B = 05 04 00 00 01 ff

Only bytes 0..1 differ; bytes 2..5 are identical. Every one of the 120
calls returned a CCI data length of 6.

The corresponding query with recipient=CON returned one identical
six-byte response in 40 reads. So the alternation was not observed in
this same-sized control, though that does not by itself locate the
fault between the PPM and the ACPI transport.

Limitation of the spacing test: the response stays locked to
transaction parity across the tested 0-1 s inter-call intervals, which
makes a simple wall-clock or probabilistic race less likely. It does
NOT distinguish PPM payload state from a deterministic
completion/ACK/MESSAGE_IN ordering problem, because those delays occur
after ucsi_send_command() has already read MESSAGE_IN. Testing that
boundary would need a delay between command completion and
read_message_in(), or two reads of MESSAGE_IN after a single
completion. Also, the three blocks were consecutive and of even length,
so they are effectively one 120-call sequence rather than three
independent phase trials.

The second value is not constant across attachments: in an attach
session five minutes earlier it was 0a 00 00 00 01 ff instead of
05 04 00 00 01 ff. It was stable within each session.


Observation 2: two readings of the same bytes
---------------------------------------------

Parsed as the packed record Linux uses,
struct ucsi_altmode { u16 svid; u32 mid; } __packed :

  A -> svid=0xff01  mid=0xff010000
  B -> svid=0x0405  mid=0xff010000
  (earlier session) -> svid=0x000a  mid=0xff010000

so the SVID alternates and the MID is constant but useless as a DP
capability VDO.

Parsed with the two members in the opposite order, { u32 mid; u16 svid }:

  A -> mid=0x0000ff01  svid=0xff01
  B -> mid=0x00000405  svid=0xff01
  (earlier session) -> mid=0x0000000a  svid=0xff01

Under that reading the SVID is 0xff01 in every payload I have ever
captured, and it is the MID that alternates. 0x00000405 decodes as a
plausible DP sink capability: UFP_D capable, DP v1.3 signalling, UFP_D
pin assignment C. 0x0000ff01 looks instead like the SVID duplicated
into the MID slot.

I cannot decide between these. The CON record is unambiguously in the
Linux/UCSI order (reading it reversed yields svid=0x0000, i.e. an
end-of-list marker, which is nonsense given it is the DP mode), so the
producer is at least inconsistent between recipients under the reversed
hypothesis. Bytes past the CCI length of 6 are not part of the response
and cannot disambiguate it.


Effect on the driver
--------------------

ucsi_register_altmodes() registers whichever payload it happened to
read, and the SOP early-out

  if (recipient == UCSI_RECIPIENT_SOP && con->partner_altmode[0])
          return 0;

then prevents any further read for the lifetime of the partner, so the
first result is latched.

If the registered SVID is not 0xff01, the Type-C bus match against
typec_displayport's typec:idFF01 alias never succeeds and
dp_altmode_probe() is not reached. This is the state after a hot-plug,
captured before I issued any debugfs command, so it is not an artefact
of my probing:

  /sys/class/typec/port0-partner/port0-partner.0/svid   = 0405
  /sys/class/typec/port0-partner/port0-partner.0/vdo    = 0xff010000
  /sys/class/typec/port0-partner/port0-partner.0/driver : absent
  /sys/class/drm/card1-DP-1/status                      : disconnected

If instead the payload with svid=0xff01 is registered, the driver
matches but dp_altmode_probe() rejects it. With port0.0/vdo =
0x001c1c46 and the partner VDO as Linux parses it (0xff010000, whose
raw DFP_D pin-assignment field bits 15:8 = 0x00 and raw UFP_D
pin-assignment field bits 23:16 = 0x01, with the receptacle bit clear,
giving Linux's helper results UFP_D=0x00 and DFP_D=0x01):

  DP_CAP_PIN_ASSIGN_DFP_D(0x001c1c46) & DP_CAP_PIN_ASSIGN_UFP_D(0xff010000)
        = 0x1c & 0x00 = 0
  DP_CAP_PIN_ASSIGN_UFP_D(0x001c1c46) & DP_CAP_PIN_ASSIGN_DFP_D(0xff010000)
        = 0x1c & 0x01 = 0
  -> -ENODEV

So neither of the two alternating payloads leads to a bound DP alt
mode.

For reference, the raw CON response to the same command is

  01 ff 06 1c 00 00        len=6

and ucsi_register_displayport() turns mid=0x00001c06 into
0x1c06 | DP_CAP_RECEPTACLE | 0x1c<<8 | 0x1c<<16 = 0x001c1c46, which is
what port0.0/vdo reads. That sanity-checks my byte decoding and shows
how the current kernel transforms the CON record; it does not establish
that the SOP producer uses the same member ordering.


Other observations
------------------

  * The PPM returned one six-byte record at offset 0 and zero length at
    offsets 1 and 2.

  * After a hot-plug, GET_CURRENT_CAM(connector=1) returned 0x01 rather
    than the 0xff "none" sentinel, while GET_CAM_SUPPORTED returned
    0x01. Those two are mutually inconsistent under Linux's zero-based
    index interpretation. I mention it only as a further sign that this
    PPM's alt-mode reporting is unreliable.

  * No intel_pmc_mux device can bind on this firmware: neither INTC105C
    nor the Alder Lake IOM INTC1079 is present in ACPI, and
    /sys/class/typec_mux is empty. I therefore do not know whether
    correcting the alt-mode registration alone would be enough to light
    the display, or whether the PPM would also have to be driven into
    the CAM.


Regression status: not established
----------------------------------

The user-visible history is that hot-plug used to work, so I looked for
a kernel change.

The relevant struct ucsi_altmode layout and the dp_altmode_probe()
rejection logic are unchanged across every kernel this machine has run
(v7.0.5 through v7.2.3), and I found no direct change to the UCSI
alt-mode read path between 7.1.9 and 7.2.3 - the changes there are the
msg_out/write_message_out plumbing, an unregister refactor and lockdep
annotations.

This is only a source audit. Indirect timing or ordering changes
elsewhere, and firmware state, remain possible. I have not yet run the
same unplugged-boot-then-hot-plug procedure under an older kernel, so I
am not claiming a regression and I have not copied
regressions@lists.linux.dev.


Reproduction
------------

With the cable attached, as root:

  D=/sys/kernel/debug/usb/ucsi/USBC000:00
  for i in $(seq 1 10); do
      echo 0x101000c > $D/command   # GET_ALTERNATE_MODES, SOP, con 1, off 0
      cat $D/response
  done

The responses alternate. Substituting 0x100000c (recipient CON) gives a
stable response. The debugfs "status" file only records negative
errors, so the positive return value (the data length) is not exposed
there; I used a kretprobe on ucsi_send_command() for that.


Questions
---------

  1. Has an SOP-only member ordering, or an alternating offset-0
     response, been seen from other UCSI PPMs? Is there a reading of
     these six bytes that I have missed?

  2. Which capture would best distinguish PPM payload corruption from
     an ACPI completion/MESSAGE_IN ordering problem: a debug patch that
     delays or repeats read_message_in() after a single completion, a
     PD Discover Modes trace from an analyser, or data from the working
     boot-attached case?

  3. If the correct partner record can be established independently,
     would a DMI-scoped fixup in ucsi_acpi's sync_control be the right
     layer, or should this stay a firmware-only issue?

I have the machine available and am happy to run debug patches or
further captures.

Thanks,
Ismail Tarim
