Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267084825D5
	for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 17:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789406626; cv=none; b=QQzORsEcVzz/2I3FZyvmof7ILKqwO2R1OkYCRzDaKKZ2APKmdgS1BoASq/ffL3sGe45wfna7t2G/No+5h/e8qfpdQZAfGLy1RSZhX/XZFC2oKImZOIPj4tDAdLDLArHaHR2H3M7RL5rn+XEYIZirwYAS2klIxpVE79fGTE2mPus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789406626; c=relaxed/simple;
	bh=4oHF2Eat6k72PJTngrCMahrVR9myK7ASkiIuFcNmiZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DyXkqExVHDA89O7/Rq5fNOluqiJbP7FEe3HTctwWb+Sb5+UIqV62qUNGbTKkUmHYfiqrmfwGkwhigYuk9ZBfZntIriLhMEMClZH1ehKL+8xdliKaQzSYwU1CvM+iV8JV8anP1sOMYepNIVQ7XQRLuO0PS0i2z/irV/Dnu7A98po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MzyxYBF+; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MzyxYBF+"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351832so1271368f8f.3
        for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 10:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789406622; x=1790011422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xYF4ZfbMwnUrNRIM8rc7WKTmFbe7IkNY9IAOIcyuFNc=;
        b=MzyxYBF+gVOYs4oEWA0xG0ZIwgnurNopmuthqw+8714H0cBfbOmWq84pUpkh2CckDr
         WIJv3g2eL4/TlyXZ05kgkslgd6f839VyS2v7RFA2jMy1QUjzmpI99ULIJNCW1tVt82e/
         6SuzCngJV3Zfz3Llz1GYghmQDhvFG6GgykKwJpmAa5cyvHSNsc4MKl5V5QK6fDPzK3jb
         leiKC7Hcq0Svq+QDK3Y1PlbOi8/3Z4r2kx5u/Cly8+XG5XuwxjFaocMvzwhWTtxVADFe
         yX/6Hptw30ZkPbyzDpBgkJpze80Bce3VoGhNNR2bNTcRs1R7uJJxxmFn4nAb3e8BWlns
         7qfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789406622; x=1790011422;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xYF4ZfbMwnUrNRIM8rc7WKTmFbe7IkNY9IAOIcyuFNc=;
        b=10ebtYn/nJJYay3e4gD5QCgIvHZjCYexS/ynsJW5Jv7727k9RtI0QrgMV8dAxIJUyX
         Azs0raPz0i4/bQZ/4L3zQQ10XS4PuqQ4keidQvl1qm//aDaWUvGRjbi3ONwCRwD9tJYD
         NxWX9cHnBdqlCQErRkvO1dYMCncKSytLEsSkGcegmQ7OfqSXpT9iN85Og0sbmnsPfvII
         Ki3UOssoV/4fIU5MG/zqKvtXKPvvoCnzVKXSS9SoUhqc+DkeKFVWo/kxPYDjPmmdiShZ
         oqa5LyUxWSlmJu6zJ3GvFRC1tz/NvOlhm32Nkh4gdrNlv00uC38GUifGHRKjU1jZgg4j
         m1Rw==
X-Gm-Message-State: AFuF++kRHDQJXyjngZ7pRmkjuRyNqFoNnJxvSTl5fFEaJPhKjCzxpulf
	tQqYbLAJ445ALwbcLBkxWHf+AL9excnCirTdTjTTqbBxqUVAZtz4sn/5
X-Gm-Gg: AYBFou2HaNfvy4IEPwaEdmgXHLjhW7i/Ad46Z4GsP/VKEVxM7wko14Oxxc3fFgRNuM+
	ZZkLHWgvMm4ZzNKfnC2UpZUl9ncU9/yH2nyZcJNqOyzzeTs1dAlGv2RQlpd9FS7+yQ+54OtRVu6
	ea5unNRJQeRE902ahyzUmA1OtIxBCKdej+44QgY1RhHVybMBJrGymbjlkq4FYz6TE0qX2ekVo8Q
	sE5eHhuwY2wzR8KTjwSbxoHtGV2L8Mogd0hYczHb5W05LNlGOJgoT+eyy+APsP6sdBZQH9vLLWy
	x+xCC7ZLWE3DDg9KZEAU9ljBlOZDJC50N2yvR856UeSjyR3yNC8ShFui887koK78mbqwv7Ceq5R
	82S6A+giFgd2d3DYPPVa9YkMpqbxBv/HA1axUqwuIcsEgeyYnblZxWppFq0Q7nAx2LC5/fw3yTi
	K7B/Ma45B4+BgGv/HXWRM5LjqABknG2u4WLChNCOr00i6qqE6lcU9fnWWaSaYII3T6ZSZ1BC31z
	JsAA3KA3wnyQvOL8uDFUPMALLI=
X-Received: by 2002:a05:6000:3c8:b0:487:8:1d25 with SMTP id ffacd0b85a97d-48702ab924emr4811637f8f.17.1789406621970;
        Mon, 14 Sep 2026 10:23:41 -0700 (PDT)
Received: from cachyos ([41.249.70.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ea60sm28064873f8f.17.2026.09.14.10.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 10:23:41 -0700 (PDT)
From: =?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
To: linux-sound@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	alsa-devel@alsa-project.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 0/3] ALSA: usb: add RME Babyface Pro driver (proprietary mode)
Date: Mon, 14 Sep 2026 18:23:31 +0100
Message-ID: <20260914172334.49074-1-i.bahloul01@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

This is v4 of the RFC for a driver for the RME Babyface Pro in its
proprietary USB mode (VID 0x2a39, PID 0x3fc0).  In that mode the PCM
stream runs on interrupt endpoints instead of the class-compliant
isochronous path, so it cannot be a quirk on top of snd-usb-audio and
needs a standalone driver, modelled on snd-usb-caiaq.

Changes since v3:

 - A real bug in the crosspoint routing matrix, found while trying to
   hardware-verify the dB TLV metadata added to the crosspoint faders
   (below): the AN1/2 output's own crosspoint fader had no audible
   effect on the signal, for every source, for as long as the matrix
   has existed - a generated tone swept from off through +6 dB
   produced no change at all, while the identical control targeting
   any other output tracked the fader correctly. The vendor software's
   own capture shows why: for this one output it always writes a
   second register (the "low map") alongside the usual crosspoint
   address, at the same value; the driver wrote only the usual
   address. Three call sites (the live control, the probe-time
   default, and the reconnect/resume replay) needed the same fix,
   folded into one exported helper. Verified fixed with the same
   tone-sweep method that found it, and that a real crosspoint value
   survives an actual unbind/rebind, both the cached control and the
   audible level.

 - Two real bugs found, diagnosed and fixed by David Fredman, who also
   became this driver's second tester, on an original (2015, non-FS)
   Babyface Pro:

   * The stream URBs were submitted without URB_NO_TRANSFER_DMA_MAP
     even though their buffers come from usb_alloc_coherent(), so the
     USB core tried to map them a second time and failed with -EAGAIN
     on any IOMMU-translated host.  That is the default on current AMD
     and Intel desktops, which means v3 as posted would not have
     streamed at all on most machines.  Every other sound/usb driver
     that allocates coherent buffers sets this flag; this one was the
     exception.

   * The mic preamp gain register was decoded as a 5-bit value plus a
     rotating transaction counter.  Bits 5-7 are in fact the fine part
     of the gain: value = (fine << 5) | coarse, coarse 3 dB per step
     saturating at 20, fine the 0-2 dB remainder.  The control was
     therefore reaching 21 of its 66 positions, and because the
     rotating value landed in those same bits, the gain actually
     applied depended on where the rotation stood - the same requested
     setting did not give a repeatable gain.  Measured on hardware
     before and after: 0.808 dB per dB of control, against 1.000 after
     the fix.

 - The power-on masters no longer come up at unity, and the -20 dB
   safety default is scoped to the two analog outputs only.  The
   routing default sends all 14 sources into every output at unity,
   and they sum, on every fresh module load before alsa-restore can
   restore the user's levels; AN1/2 and PH3/4 now come up at -20 dB,
   the level the hardware's own DIM button writes.  The four digital
   outputs (AS1/2, ADAT3/4, ADAT5/6, ADAT7/8) keep the vendor
   software's own 0 dB default instead, since nothing downstream of a
   digital feed can be damaged by a loud signal the way a speaker or a
   pair of headphones can - David Fredman flagged that the original
   six-output default reached those too, for no reason a receiving
   digital device could infer.

 - The driver is no longer FS-specific.  It runs unmodified on an
   original (2015) Babyface Pro; the two models share VID:PID,
   bcdDevice and iProduct shape, and nothing in the descriptors tells
   them apart.  card->driver, the card id, the shortname and the
   Kconfig text are model-neutral accordingly.  This seemed worth
   getting right before the strings are frozen by a release, since
   card->driver is what alsa-lib configs and UCM profiles match on.

 - The front-panel DIM button acts now instead of only being decoded.
   SET already toggled phantom from the same poll.  Its scope (Phones
   only) matches the one vendor capture we have of it; whether that is
   the only possible target or just the default "Main Out" assignment
   is an open protocol question, noted rather than guessed at.

 - Added dB TLV information to the preamp gain, trim and crosspoint
   controls; only the output masters had any before.  Hardware-
   verifying the crosspoint curve is what surfaced the routing bug
   above.

 - Fixed a state-restore bug in the input trim: it is one shared
   register per input pair but two per-channel controls, and the
   restore replayed the pair from its even index, so a trim set on the
   odd channel was silently dropped on re-probe.

 - Split into three patches rather than the four of v3.  The v3 split
   put the mixer in its own patch, which meant earlier patches carried
   stub control functions that later patches replaced.  The mixer and
   the core share the device state structure and the whole
   save/restore path, so that seam was artificial.  The front panel
   and the DSP EQ are genuinely separable: each of the three patches
   here contains only final code, nothing a later patch rewrites, and
   each builds in-tree on its own.

Known limitations, stated up front:

 - USB autosuspend is not supported.  It is explicitly disabled at
   probe rather than left as an untested path: the panel poll and
   keepalive work items run continuously and nothing pairs
   usb_autopm_get/put around the stream.  S3 suspend/resume works and
   is tested.

 - A few protocol details are not fully pinned down and are documented
   as open: the preamp readback index semantics, a width
   strip-ownership edge case, whether DIM's scope is reassignable with
   TotalMix's Main Out setting, and the exact high-frequency warping
   of the EQ coefficients against the vendor curve.  None of them
   affect the shipped controls.

 - The latency profile is chosen at load time through the
   frames_per_urb and nurbs module parameters; changing it means a
   module reload.  Runtime reconfiguration is a follow-up.

Validation: a full-duplex sweep across the whole rate x period matrix
with a signal-integrity tap, 30 start/stop cycles, mixer-state restore
across an interface unbind/rebind, and a mid-stream disconnect - 40 of
40 on the current tree.  Each patch was also built in-tree on its own
against next-20260911.

I am still mainly after feedback on the interrupt-URB PCM design, the
control naming and topology, and the subdirectory layout.

Disclosure: the reverse-engineering (decoding the USB captures, the
magic packets and the front-panel behaviour) and substantial portions
of the kernel implementation were written with heavy assistance from
AI coding assistants, credited per patch as Assisted-by.  All of it
was verified by hand on real hardware; the human authors remain
responsible for the result via Signed-off-by.

Thanks for reading,
Ismaïl

Ismaïl Bahloul (3):
  ALSA: usb: add RME Babyface Pro driver (proprietary mode)
  ALSA: usb: babyfacepro: add the front-panel poll and controls
  ALSA: usb: babyfacepro: add the hardware DSP EQ

 MAINTAINERS                             |    6 +
 sound/usb/Kconfig                       |   20 +
 sound/usb/Makefile                      |    2 +-
 sound/usb/babyfacepro/Makefile          |    4 +
 sound/usb/babyfacepro/babyfacepro-ctl.c | 3494 +++++++++++++++++++++++
 sound/usb/babyfacepro/babyfacepro.c     | 1593 +++++++++++
 sound/usb/babyfacepro/babyfacepro.h     |  494 ++++
 7 files changed, 5612 insertions(+), 1 deletion(-)
 create mode 100644 sound/usb/babyfacepro/Makefile
 create mode 100644 sound/usb/babyfacepro/babyfacepro-ctl.c
 create mode 100644 sound/usb/babyfacepro/babyfacepro.c
 create mode 100644 sound/usb/babyfacepro/babyfacepro.h

-- 
2.55.0

