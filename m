Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620891;
	b=LbxIZz/qPKJFPaDPzSWOifqq4VehJ9ZLBGbc3IX4i4xBCGUMznXdET+uysv4P5DpIRxL
	 kHq+O6jLFoqQ91/5BYme3+wlv245icr3dopnmNDFqATgfmqLFl3wuGtwb9n0soB/aNnpv
	 qbnClZrWXnLtBbTbqYVWAlTQKfigx7te2WjxiB9f+wSayDgtOZ9mqznRgS21uwNa7Q+O1
	 efA2EFy/SuOQA1t73VlqTHpw/ppeT331dztpt3Om/Di0ZiLQ0SLDrceH2xrAQp0KhFD+m
	 fJO01f+LjE9uvzK5kpJhJjQaZHEcRV+ktMOf6pLn4c5XSJazXXiavFBUi/zADolnB6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620891;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gCx3ekEjFIYQgZCLkec7gu9sq6KbvuSeHa4OppUG+rY=;
	b=bVjEv7s19nvf7nUKlRskQTMI4H1pn+qE4pifTNlsx9Sz1z9al1phj5apRL8GgfjgKzhq
	 uoKocYrQoNltTiQxSNULobx+RTJQd7EUwrLuNpGwKpXGUz7WHJVb1Bvh2jwQawSAOXimG
	 sFv4FnJ3Ig8sy88aUFYe87K0GfExSCqN0jf0c7CdsINdhhbhBie9D6n/Ltiv2STsIOFGA
	 cfS09SjUDsL9fLQXkghuOOQZy659tgJbgvIx6+Fvo3KhF/r53WCzkj3CgP+1WndpOUS0A
	 T0zezBVUGpo3n9fqu9n9SJp/dt3E3/FMsM4UeU4xPzy419/u/+EOfN3aCijeDhYzPJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JnuHXEtA;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE644606A31E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 15:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE644606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JnuHXEtA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795620890; x=1827156890;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QByrnA9aQhBS/D/jtP3PD1w7FLqGT8x3wdIjHzzhRMc=;
  b=JnuHXEtAyXkX8ZxM2LZVnNmRHUTGIEVOIPJjPihvTE0R3Xe4foG1BYXL
   ghHAso6FkMDQamZ0c4qoY0LZtea3LI87N3UILuRjV534Gt8mgShoG8aAA
   3JW4KAj5t3tjrtd2zcBfv71db4mTl8PHDRbnauvw6r+uH19urU/edHJic
   wFhUN3jXQ2a64P1Y21baJCJVltbG5/xYxVLwUof4kLGof6JF6N8WsIHkF
   ra0XV8xa/esS8VUml8/noLndUAyD7JIbfvAfB5CR6o7H/jHnyqm+M+Tpo
   Ks94vdoBWrYjX9CyR9xZ7aJiq/oUY9nLWnhUpwjzgRZPlD2Je50UhekYE
   w==;
X-CSE-ConnectionGUID: gVCWL5E8RUWWGep1KOW23Q==
X-CSE-MsgGUID: OAyU29BoS1CyBO8Sz5Jk7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4408254"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4408254"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 07:26:28 -0800
X-CSE-ConnectionGUID: ugnjPHx+Skmtsh4s3hWoag==
X-CSE-MsgGUID: s8LpWoTbRVCHYPg2lHK7oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="13938535"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa013.fm.intel.com with ESMTP; 25 Nov 2026 07:26:26 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 22570A7; Wed, 25 Nov 2026 16:26:23 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>
Subject: [PATCH 9/9] Documentation: thunderbolt: Document USB4STREAM coupling
Date: Wed, 25 Nov 2026 16:26:22 +0100
Message-ID: <20261125152623.456054-10-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261125152623.456054-1-mika.westerberg@linux.intel.com>
References: <20261125152623.456054-1-mika.westerberg@linux.intel.com>
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

From: "Mika Westerberg (Intel)" <westeri@kernel.org>

This adds a section to the admin guide describing how USB4STREAM
coupling could be used.

Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>
---
 Documentation/admin-guide/thunderbolt.rst | 119 ++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/Documentation/admin-guide/thunderbolt.rst b/Documentation/admin-guide/thunderbolt.rst
index ff25fe853706..3b71feaa1efa 100644
--- a/Documentation/admin-guide/thunderbolt.rst
+++ b/Documentation/admin-guide/thunderbolt.rst
@@ -434,6 +434,125 @@ Then you have ``/dev/tbstream0`` for ``control`` and ``/dev/tbstream1``
 for ``data``. Before you can use them you need to configure them as
 shown above for the one stream case.
 
+Coupling a stream between two other hosts
+-----------------------------------------
+If a host is connected to two other hosts, say
+``host1 <-> host2 <-> host3`` where ``host2`` is the one running Linux,
+then ``host2`` can forward streams between ``host1`` and ``host3``
+through the routers of its domain. The two hosts do not need to be
+connected directly to ``host2``, there can be device routers such as
+USB4 hubs in between.
+
+This can already be done in userspace like::
+
+  host2 # dd if=/dev/tbstream0 of=/dev/tbstream1
+
+but that copies every frame through the memory of ``host2`` and needs
+another process for the other direction.
+
+With coupling the frames go through a tunnel directly between ``host1``
+and ``host3`` through the shortest path so there is no need for a
+separate application that copies the frames. Coupling only works with
+the software connection manager as ``host2``.
+
+Start from ``host2``, where ``host1`` is ``0-1.0`` and ``host3`` is
+``0-3.0``. The coupling is created under ``coupling`` in a directory
+named after the two services, and it has a sub-directory for each of
+them::
+
+  host2 # cd /sys/kernel/config/thunderbolt/stream/coupling
+  host2 # mkdir -p 0-1.0_0-3.0/data
+  host2 # cd 0-1.0_0-3.0/data
+  host2 # echo -1 > 0-1.0/in_hopid
+  host2 # echo -1 > 0-1.0/out_hopid
+  host2 # echo -1 > 0-3.0/in_hopid
+  host2 # echo -1 > 0-3.0/out_hopid
+
+Like elsewhere in the driver ``in_hopid`` is the HopID the host on that
+side sends with and ``out_hopid`` the one used when sending towards it.
+Using ``-1`` picks the next available one::
+
+  host2 # grep -H . 0-1.0/*_hopid 0-3.0/*_hopid
+  0-1.0/in_hopid:8
+  0-1.0/out_hopid:8
+  0-3.0/in_hopid:8
+  0-3.0/out_hopid:8
+
+HopIDs are allocated per adapter and per direction, so each adapter has
+one for the packets coming in and another for the ones going out (more
+details can be found from USB4 spec). In the above example there were no
+other tunnels through the lane adapters so the first available HopID in
+either direction is ``8``.
+
+Each host announces its streams to the other side of the link which
+allows performing auto-configuration on that side using the same name
+for the stream.
+
+Now ``host1`` and ``host3`` only need the stream created because the
+HopIDs are picked up from what ``host2`` announces, reversed so that the
+``in_hopid`` of one end matches the ``out_hopid`` of the other::
+
+  host1 # cd /sys/kernel/config/thunderbolt/stream
+  host1 # mkdir -p 0-1.0/data
+
+  host3 # cd /sys/kernel/config/thunderbolt/stream
+  host3 # mkdir -p 0-1.0/data
+
+Note that ``host2`` is ``0-1.0`` for both of them, the service names are
+relative to the domain of each host. The other way around works just as
+well: if the streams on ``host1`` and ``host3`` are configured first,
+creating the two directories on ``host2`` is enough and the HopIDs of
+both of its sides are picked up from them. It is also possible to
+configure HopIDs manually.
+
+There is no ``/dev/tbstreamX`` node on ``host2`` because the frames do
+not go through it. Once all four HopIDs are in place and both hosts are
+connected the tunnel is established and ``host1`` and ``host3`` can talk
+to each other as if there was a single cable between them. It can be
+inspected with ``tbtunnels`` from tbtools.
+
+The tunnel only covers the routers that are actually between the two
+hosts and it turns at the closest common router of the two, which is not
+necessarily the one of ``host2``. If both hosts are connected to the
+same hub below ``host2``::
+
+              [host2]
+                 |
+               [Hub]
+              /     \
+        [host1]     [host3]
+
+then the tunnel goes only through the hub, not involving the host router
+on ``host2`` at all. ``host2`` still needs to set it up because it
+is the connection manager of that domain.
+
+After this the ``/dev/tbstreamX`` on ``host1`` and ``host3`` can be used
+like a regular stream described in the previous section, with the
+difference explained below. The hosts ``host1`` and ``host3`` do not
+need to support coupling themselves and can be even using firmware
+connection manager.
+
+Each hop of a path keeps track of the credits it has sent and received,
+and this state is only reset when the path is set up (see the USB4 spec
+for details). For a coupled stream the path is split between three
+hosts: ``host1`` and ``host3`` set up their part when the stream is
+opened and tear it down when it is closed, while the part ``host2`` set
+up stays in place. It is therefore recommended that the whole tunnel is
+torn down and recreated before a new transfer takes place::
+
+  host2 # cd /sys/kernel/config/thunderbolt/stream/coupling
+  host2 # rmdir 0-1.0_0-3.0/data
+  host2 # mkdir 0-1.0_0-3.0/data
+
+This assumes both sides announce their HopIDs so the coupling can be
+re-created based on those. Otherwise HopIDs need to be filled in as
+well.
+
+The coupling stays until it is removed as below::
+
+  host2 # cd /sys/kernel/config/thunderbolt/stream/coupling
+  host2 # rmdir -p 0-1.0_0-3.0/data
+
 Forcing power
 -------------
 Many OEMs include a method that can be used to force the power of a
-- 
2.50.1

