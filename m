Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0067E2931F0
	for <linux-usb@vger.kernel.org>; Sat,  1 Aug 2026 16:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785600349; cv=pass; b=tWF0qQKcEoI04dblEwDDOF0t+r1DE9taKv/L2VcZLNbnJbrr4JMpb7Lg4kk8TNPNZL43OCpl0zAOxViI04fpdncdslb+X6thJ9QsQIYFZUeXCWRx4G/DbMGH2KLeUzBl1UEsI0SAVSmpXVRw3nWBHfYJPwQHYpTI6mrBfFRrSFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785600349; c=relaxed/simple;
	bh=1s+k8tyBOhZPxlFWvGN/J1vpjulmW34RLDYSL4C+Ah4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=uaoQEQLydKcRWCAgLXnAKOZcvor8/5kksv3S0kQaM2UYKGutN6htA6yXeyqiEV6+2wIGCwls8cNqBeIbrUczt/5PYceQej7wpk59zTRQvvhkCaRZn1El/Eu+h4pd0aUjXXMGWpHzpEAo0XmS37/oTETbUYnBbJhIvf2uh7l62gg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=behler.me; spf=pass smtp.mailfrom=behler.me; dkim=pass (2048-bit key) header.d=behler.me header.i=@behler.me header.b=oGQ+BWLU; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=behler.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=behler.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=behler.me header.i=@behler.me header.b="oGQ+BWLU"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-664c6304683so1847580d50.2
        for <linux-usb@vger.kernel.org>; Sat, 01 Aug 2026 09:05:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785600347; cv=none;
        d=google.com; s=arc-20260327;
        b=HDGt8GusazVhfvKMCKOh+ljg1m61jYBTfIIYNgFfelfMPq43R0KdwCxtlXuN+khSI8
         bFwlmO2OBM8mruVuVXbmksqOYTt75nefx8hIW0lAt/lDtIwOOeLYtzeb87kVwBBHdiRk
         O0pprBD1zdI9LTZMAA9jYPFzmbVujXuz2IZgk0+mQA6G3fyqy7fQhX/jelsoIp03ild1
         8lcvesWwW+Dc/dI8ZypsNtBBMh6HAIxpzVr0q5aQaBlzce9hizPQrHuJfI/vF886jEk2
         RSyRitdUt/vUxtCC0SANxxkdjcw6E3yaixlXI/pT18luVXPiaPytt6sndNom2aMuDL9w
         uu/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=XMV4g3BZPpWE/yWFeGUE5X630AsemOBuxoyOXwBAQaM=;
        fh=Bbcf4hivZNfTN8ijOKMz6dJ5JqjWwwdD5xgTSLsMjfo=;
        b=H9vbveqPuiWUNn++IwOPdSQImGxXsbUVvU96nlD+yzqbxcK8BIQf/V6IiHkeE7v/Py
         YIQZ+MM0LkQNHLWPmc0RlXPsY6j10YxdUMLJ/4IqvtFuduU1Hu55WRasKnOoNX3qWhCZ
         kyOPjTUXJoCtl5iGy2UnuScvklnVuAZQ9263bR9jvWEZlgLsYufhWFcQBKeoE0rkmSTC
         9WysZ7/llT1mKDkmf+oUwxYAI+cK2IJHPvxfkKS+id/PFqkbiUWblwYuy0LkPH2+tMso
         XmcDMYANKnnAi8FPoeV08AkfPDG68jNgOd0VfgUMwLNqLbtFFQveeuGjtorFDN/QLMEI
         YGIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=behler.me; s=google; t=1785600347; x=1786205147; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XMV4g3BZPpWE/yWFeGUE5X630AsemOBuxoyOXwBAQaM=;
        b=oGQ+BWLUSKW8lhGX8IZ6Nt7cfjHsXs+02/f1kkCRRSUqTbGu3W98MTLTTSo6NmH53z
         CiopkFpFuVLs32G/1PUfhB6xHX/u6vUmQjWjoQHarlSGx40P/DXWp5NgBE9cvRqFacl0
         /EGRsuGLY6AdaecMP1gGWHgUKowNs932IRXysGI+S3pNsUi258VY2RhDsp+Z4UXAAYk/
         zoVExDq2kC8oglwXXmGiIrh6+s0ElGJZuzXtqrzrGmLRtx4r1NXLIAFMzyiiGYbCflh6
         2OFtR1mmMQjSRFoEr+duhNd7vM1Gae4+C9LcdzHyoco2GI7HbrJBetD7MVfapvBFhDL3
         TDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785600347; x=1786205147;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XMV4g3BZPpWE/yWFeGUE5X630AsemOBuxoyOXwBAQaM=;
        b=hWRlTw4IdJZCOP3U/VPB+sLqoWjoAhic7cMf0d+gikHudlccUaLXZq26aXrAnoF9fj
         bGv1rN7caO4zPFZwtrnkO4HFjO81E1/SjXtcG0EDJ7QFPLm6zwvHXZjrpzfq89ORf+pt
         k6Chj8E6aw8ZYcHuFBdE7RewcB4AlcQKCU2RfAG7RHhmD0HjEGxtL7mMiT8koylPmmnf
         gcQ3aKx/ztJbgJOUnWowUvI6EVxWFdyykKfLCrjS0l7wkn+K2pbcxEM02/BDkhlhgpJj
         GXv+30jURKvsDvS3CO8e20yMhsWlJKwex3Fra6uo0jOqEdu/ZEVsTC2wdSmDbq7sRbiS
         RxvA==
X-Gm-Message-State: AOJu0Yz5M3kCipIghmeRdNmpherOEPP3umf0Fc+Zm65InH8lYR6wyjYP
	lDjj07/VV/eCh4FPpoU25RRtyy0iFnYQ1gBTakqgCgHWIbsolq0H1+C6s25bB4iAysEjLj75NGK
	N9eBqx9gMc/Hs9LXSD0DgOnJpSo9fAFoeIs0qDvCWMxaNYAnQeLbpXt8=
X-Gm-Gg: AR+sD10GNp2nrbsgRRYRE+tzJ2b7xqCRu8PyCZvQV/+Hkc7BiM8av7OWduBGWgAvxmf
	FsXwYRNOyfDPaMsihgVFFcNNJrIkdeR2MaOL/K6wbPOM+y56Chunc3FFfOZTT/9wdR3QdglHqXU
	Cqd2vc0TiKvoWIu/OnekGSsyxnOUix8wYEv7tZOaa3jy+GJk3sAm/Y3Ah2wTO4ml4CFvPWV6vT6
	A/dcJptZFznV/wJ1n90rSVXask//Zo8YXgjxoAqDBx9bLpS/wNxDBhN4+GM/e+JHqO0hsixa7oi
	K5A3FGIC0x0e6+uhPU2lV0Nw0G4QqTDvl3i1oSu+6rwNYhkfsZ3oW5B1AWkhEDNy3qKnUjkwQDu
	t49ZTfmq7er/q
X-Received: by 2002:a53:cc4f:0:b0:667:c3c0:f2b7 with SMTP id
 956f58d0204a3-6694f0a7488mr4235374d50.19.1785600346674; Sat, 01 Aug 2026
 09:05:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bernd Behler <bernd@behler.me>
Date: Sat, 1 Aug 2026 18:05:34 +0200
X-Gm-Features: AUfX_myTGQEgFAnuavm2rETdEKM6wPsVH5mJSLK-QjJxN1Au5BXvDoH27Vz5AwQ
Message-ID: <CAM=hwCxiJwODObeut=JcCA8jbu4C-XVEKJpR-y2MnDJibBQyOw@mail.gmail.com>
Subject: =?UTF-8?Q?Apple_Studio_Display_=282026=2C_Thunderbolt_5=29_=E2=80=94_DP_tu?=
	=?UTF-8?Q?nnel_torn_down_every_few_minutes_on_Intel_TB4_host?=
To: linux-usb@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Summary
-------

An Apple Studio Display (2026 model, Thunderbolt 5) connected to an Intel
Arrow Lake-H host with integrated Thunderbolt 4 loses its DisplayPort
tunnel every 2-5 minutes under normal desktop use. The screen goes black
for ~2 s, occasionally for several minutes. The Thunderbolt link itself,
the tunnelled USB3 and the tunnelled PCIe stay up throughout -- only the
DP tunnels are torn down and re-established.

The previous Studio Display model (2022, Thunderbolt 3) on the same host,
same port, same cable, same kernel does not show the problem.

Hardware
--------

Host:        Intel NUC 15 Pro "Cyber Canyon" (NUC15CRKU5), Core Ultra 5 225H
Host TB:     integrated, 8086:7ec2 / 8086:7ec3, host router generation 4
GPU:         Intel Arc 130T/140T (8086:7d51), i915
Kernel:      7.1.4-arch1-1 (Arch Linux)
Compositor:  Hyprland / aquamarine (Wayland, atomic KMS)

Failing display -- Apple Studio Display 2026
- EDID: manufacturer APP, model 44614, made week 1 of 2026
- TB device 0x8025, generation 4, 20.0 Gb/s x 2 lanes, NVM 64.81
- contains an Intel JHL9480 (Barlow Ridge, TB5) -- appears as
  8086:5786 PCIe switch behind the tunnel
- firmware updated via macOS immediately before these traces; no change

Working reference -- Apple Studio Display 2022
- EDID: manufacturer APP, model 44602, made week 7 of 2022
- TB device 0x801f, generation 3, NVM 67.0

Symptom
-------

Reproducible within minutes by scrolling bright web pages. Frequency under
load is one event every 2-5 minutes. Recovery is usually ~2 s; three events
during the session took between 2 and 3 minutes.

Only the Studio Display blanks. A second monitor on HDMI is unaffected.

Trace
-----

drm.debug=0x104 plus "module thunderbolt +p". A single event:

  i915 0000:00:02.0: [drm:xelpdp_pica_irq_handler] pica hotplug event received,
                     stat 0x0000000c, pins 0x00001800, long 0x00001800
  i915 0000:00:02.0: [drm:intel_dp_hpd_pulse] got hpd irq on
                     [ENCODER:521:DDI TC3/PHY TC3] - long
  i915 0000:00:02.0: [drm:drm_dp_dpcd_access] AUX USBC3/DDI TC3/PHY TC3:
                     Too many retries, giving up. First error: -6
  i915 0000:00:02.0: [drm:intel_dp_hpd_pulse] got hpd irq on
                     [ENCODER:549:DDI TC4/PHY TC4] - long
  i915 0000:00:02.0: [drm:intel_tc_port_reset_mode] Port G/TC#4:
                     TC port mode reset (disconnected -> tbt-alt)
  i915 0000:00:02.0: [drm:drm_dp_tunnel_destroy] [DPTUN 1:1:5] destroying
  i915 0000:00:02.0: [drm:drm_dp_tunnel_destroy] [DPTUN 1:1:6] destroying

Thunderbolt side of the same event:

  thunderbolt 0000:00:0d.3: acking hot unplug event on 1:11
  thunderbolt 0000:00:0d.3: 1:11: DP OUT resource unavailable: adapter unplug
  thunderbolt 0000:00:0d.3: 0:5 <-> 1:11 (DP): deactivating
  thunderbolt 0000:00:0d.3: acking hot unplug event on 1:12
  thunderbolt 0000:00:0d.3: deactivating Video path from 0:5 to 1:11
  thunderbolt 0000:00:0d.3: 0:5: detached from bandwidth group 1
  thunderbolt 0000:00:0d.3: 0: released DP resource for port 5
  thunderbolt 0000:00:0d.3: 0:6 <-> 1:12 (DP): DPRX read timeout

The "hot unplug event" originates from the device router; the host acks it
and tears the tunnels down. "DPRX read timeout" recurs on every event.

In one earlier trace the teardown was preceded by a bandwidth-allocation
request from the display asking for zero:

  thunderbolt 0000:00:0d.3: acking DP_BW (0x20) notification on 0
  thunderbolt 0000:00:0d.3: 0:6: requested bandwidth 0 Mb/s
  thunderbolt 0000:00:0d.3: 0:6 <-> 1:12 (DP): bandwidth allocation
changed to 0/0 Mb/s
  thunderbolt 0000:00:0d.3: acking hot unplug event on 1:12

Later events start directly at the active adapter 1:11 with no such
prelude, also with bw_alloc_mode=N.

Possibly relevant: tunnel topology differs between the two models
-----------------------------------------------------------------

Both displays expose a 2x1 tiled EDID (2560x2880 per tile).

2026 model -- i915 drives the full 5120x2880 through a single tunnel at
HBR3; the second DP tunnel exists but never carries a stream:

  0:5 <-> 1:11 (DP): consumed bandwidth 0/22500 Mb/s      <- carries all of 5K
  0:6 <-> 1:12 (DP): consumed bandwidth 0/0 Mb/s          <- idle
  port_clock=810000, lane_count=4

2022 model -- driven as two real tiles, both tunnels carrying video:

  0:5 <-> 1:10 (DP): consumed bandwidth 0/17000 Mb/s
  0:6 <-> 1:11 (DP): estimated bandwidth 19000 Mb/s
  port_clock=540000, lane_count=4

The idle second tunnel of the 2026 model was the adapter that unplugged
first in the earliest traces.

Link maximum on this host is 36000 Mb/s. The tunnelled USB3 grows to
14738 Mb/s when DP releases bandwidth.

Ruled out
---------

Each of these was tested; the trace signature stayed byte-for-byte
identical.

- Display firmware update (performed via macOS; now NVM 64.81)
- thunderbolt.clx=0 -- link low-power states
- thunderbolt.bw_alloc_mode=0 -- DP bandwidth allocation mode
- Thunderbolt/PCIe runtime PM (power/control=on on the NHI controllers,
  the tunnel PCIe ports and all TB devices). This did eliminate a
  separate, rarer failure in which the whole TB link dropped for ~8 s
  including USB -- but has no effect on the DP-only events described here.
- Cable: swapped the 2026 display's cable for the 2022 display's TB3
  cable. Link still negotiates generation 4 at 20 Gb/s x 2; failure
  unchanged.
- Bandwidth / link training: AUX dies outright (-ENXIO), no retrain is
  ever attempted.
- PSR / Panel Replay: "Sink support: PSR = no, Panel Replay = no".

Not yet tested: driving the 2026 display as two explicit tiles to mirror
the 2022 model's working configuration.

Questions
---------

1. Is the host expected to tear down both DP tunnels when one DP OUT
   adapter signals unplug, or could the teardown be scoped to the
   affected adapter?
2. Would a debounce or retry be appropriate before releasing the DP
   resource, given the adapter reappears ~2 s later?
3. Is the recurring "DPRX read timeout" on this device a known interop
   issue? dprx_timeout is at its default of 12000 ms here.

Happy to test patches or collect further traces.

Thanks,
Bernd Behler
