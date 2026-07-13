Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5FF3BC69C;
	Mon, 13 Jul 2026 09:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783936447; cv=none; b=hGMvNB+oWz3439M24Cl18Es+rQURF+m7DPnbRo2zt/NWeyBZaLofXXm2y5fEORwQMCaP7mt5/pGOJ4vN2eeKIJ1VG0ScTmGhAgxcwOYlbaBIheAu/HSeZ0usq6CMbISlpYbfIUcZd/2OaKwQ88P1zfWvAY6GRHKjAaQ6GEa0Yew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783936447; c=relaxed/simple;
	bh=PE28TTtme+Oo86aLo1BQXrXbX3VISjzNf72tIeKZb3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/HdJQ+/UUl3J4Wq7NxkKw4dHez+ln+eHYOxqCkvMpdcvtxbYxftJUtZMNXIlXf/8T/ymnsZW+usoe8n2CO+Jb13zsDGLq4SgiFfY0f0jHb84BM9giFvk7Q6Gdzb/Kf1WbPAnoiwY715VGdO9+VTv1ZmneWXTtMKnKD/XcppP+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gn3D4hHi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gn3D4hHi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783936445; x=1815472445;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PE28TTtme+Oo86aLo1BQXrXbX3VISjzNf72tIeKZb3g=;
  b=gn3D4hHiU1g3RTqsFM7OLqKuLPxAr018mZDG9MhR37psBgseOKaWH+IN
   5H4tbS+byu+3yy+XIdzqn1GHc0/LhZ29NdcrQTRCTH1C6oVWDKr7qKBdV
   WJDzGJHiKYIBJ+25eYCv3fzwSoRqWUkZRUSYS/9Gbtbz1RGsoxyDCQaUh
   s+3mTl6+o2yPa6RG7AuebKwEd9Q56Jty2piM7Yq8+bKp8N/GftX2meS9h
   oZFeTlk2kgQ1wBJ387TReWWDkabNt59u570H0EBf3YdGbvtlAkDT4uFeC
   WUsdKzxn20Db23HbWi64CBhfc4iSmZTy7h0GixsvrM7DBNXykIjOjWFyV
   Q==;
X-CSE-ConnectionGUID: ompysha/TmKBn+tRLgoQjQ==
X-CSE-MsgGUID: 0EIGSl1ERkatZdUc1hh1IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84657665"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84657665"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 02:54:05 -0700
X-CSE-ConnectionGUID: 3jXurlDxTeCcZdw7O+YlvQ==
X-CSE-MsgGUID: W1EhK4eVRryQcppJA1+FeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="249144205"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 13 Jul 2026 02:54:02 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id AA8D995; Mon, 13 Jul 2026 11:54:00 +0200 (CEST)
Date: Mon, 13 Jul 2026 12:53:59 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jameson Thies <jthies@google.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] usb: typec: ucsi: Detect and skip duplicate
 altmodes from buggy firmware
Message-ID: <alS1tywaoP_0ECVl@kuha>
References: <20260713084323.287516-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713084323.287516-1-acelan.kao@canonical.com>

On Mon, Jul 13, 2026 at 04:43:21PM +0800, Chia-Lin Kao (AceLan) wrote:
> Some firmware implementations incorrectly return the same altmode
> multiple times at different offsets when queried via
> UCSI_GET_ALTERNATE_MODES.  This causes sysfs duplicate filename errors
> and kernel call traces when the driver attempts to register the same
> altmode twice:
> 
>   sysfs: cannot create duplicate filename '/devices/.../typec/port0/port0.0/partner'
>   typec-thunderbolt port0-partner.1: failed to create symlinks
>   typec-thunderbolt port0-partner.1: probe with driver typec-thunderbolt failed with error -17
> 
> The matching rules differ by recipient:
> 
>   - UCSI_RECIPIENT_CON (port) and UCSI_RECIPIENT_SOP_P (plug):
>     Two altmodes with identical SVID and VDO are byte-for-byte
>     duplicates and the second has no observable function, so drop it.
> 
>   - UCSI_RECIPIENT_SOP (partner):
>     The typec class binds each partner altmode to a port altmode of
>     the same SVID via altmode_match()/device_find_child(), which
>     returns the first port altmode with a matching SVID.  If the
>     partner advertises more altmodes for SVID X than the port
>     advertises, the surplus partner altmode(s) collapse onto an
>     already-paired port altmode and trigger the
>     "duplicate filename .../partner" sysfs error during
>     typec_altmode_create_links().  Use the port-side altmode count for
>     SVID X as the authoritative cap and reject any partner altmode
>     that would exceed it.  This preserves legitimate multi-Mode
>     partner altmodes (vendor SVIDs that the port really does
>     advertise more than once) while filtering the firmware-generated
>     duplicates that have no port counterpart, and is therefore
>     stricter than a plain SVID+VDO comparison (which still admits the
>     Thunderbolt case where firmware reports the same SVID twice with
>     different VDOs) without being over-broad like a plain SVID match
>     (which would falsely drop legitimate vendor multi-Mode entries).
> 
> If a duplicate is detected, skip it and emit a clean warning instead
> of generating a kernel call trace:
> 
>   ucsi_acpi USBC000:00: con2: Firmware bug: duplicate partner altmode SVID 0x8087 at offset 1, ignoring.
>   ucsi_acpi USBC000:00: con2: VDO mismatch: 0x8087a043 vs 0x00000001
> 
> The duplicate detection logic lives in a reusable helper
> ucsi_altmode_is_duplicate() and is invoked from
> ucsi_register_altmodes().  It applies to all three recipient types:
> partner (SOP), port (CON), and plug (SOP_P) altmodes.
> 
> Fixes: a79f16efcd00 ("usb: typec: ucsi: Add support for the partner USB Modes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> --
> v7. - Rephrase the warning message ", ignoring." to ", ignoring but
>       please contact the BIOS vendor to fix this issue."
> v6. - New helper ucsi_altmode_count_svid() counts altmodes with a given
>       SVID in any of the per-connector altmode arrays.
>     - ucsi_altmode_is_duplicate() for UCSI_RECIPIENT_SOP no longer asks
>       "have I seen this SVID before". It now checks whether
>       partner_count_for(svid) >= port_count_for(svid) and rejects only the
>       surplus.
>     - For UCSI_RECIPIENT_CON and UCSI_RECIPIENT_SOP_P, behavior is
>       unchanged: still SVID+VDO exact-dup match.
>     - Commit message rewritten to spell out the per-recipient rules and
>       why partner needs the cardinality cap (avoids both the SVID-only
>       false positives that hurt the legitimate Dell 0x413c case and the
>       SVID+VDO false negatives that let the Thunderbolt 0x8087 firmware
>       bug through).
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 132 ++++++++++++++++++++++++++++++++++
>  1 file changed, 132 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 642acc09d861..b9343bf67357 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -550,6 +550,129 @@ static int ucsi_register_altmode(struct ucsi_connector *con,
>  	return ret;
>  }
>  
> +static void ucsi_dump_duplicate_altmode(struct ucsi_connector *con,
> +					u8 recipient, u16 svid,
> +					u32 existing_vdo, u32 new_vdo,
> +					int offset)
> +{
> +	static const char * const recipient_names[] = {
> +		[UCSI_RECIPIENT_CON]    = "port",
> +		[UCSI_RECIPIENT_SOP]    = "partner",
> +		[UCSI_RECIPIENT_SOP_P]  = "plug",
> +		[UCSI_RECIPIENT_SOP_PP] = "cable plug prime",
> +	};
> +
> +	dev_warn(con->ucsi->dev,
> +		 "con%d: Firmware bug: duplicate %s altmode SVID 0x%04x at offset %d, ignoring but please contact the BIOS vendor to fix this issue.\n",
> +		 con->num, recipient_names[recipient], svid, offset);
> +
> +	if (existing_vdo != new_vdo)
> +		dev_warn(con->ucsi->dev,
> +			 "con%d: VDO mismatch: 0x%08x vs 0x%08x\n",
> +			 con->num, existing_vdo, new_vdo);
> +}
> +
> +/* Count altmodes in @altmodes that advertise @svid. */
> +static int ucsi_altmode_count_svid(struct typec_altmode **altmodes, u16 svid)
> +{
> +	int count = 0;
> +	int k;
> +
> +	for (k = 0; k < UCSI_MAX_ALTMODES; k++) {
> +		if (!altmodes[k])
> +			break;
> +		if (altmodes[k]->svid == svid)
> +			count++;
> +	}
> +
> +	return count;
> +}
> +
> +/*
> + * Check if an altmode is a duplicate. Some firmware implementations
> + * incorrectly return the same altmode multiple times, causing sysfs errors.
> + * Returns true if the altmode should be skipped.
> + *
> + * The matching rules differ by recipient:
> + *
> + *   - UCSI_RECIPIENT_CON (port) and UCSI_RECIPIENT_SOP_P (plug):
> + *     Two altmodes with identical SVID and VDO are byte-for-byte duplicates
> + *     and the second has no observable function. Drop them.
> + *
> + *   - UCSI_RECIPIENT_SOP (partner):
> + *     The typec class binds each partner altmode to a port altmode of the
> + *     same SVID via altmode_match()/device_find_child(), which returns the
> + *     first port altmode with a matching SVID. If the partner advertises
> + *     more altmodes for SVID X than the port advertises, the surplus
> + *     partner altmode(s) collapse onto an already-paired port altmode and
> + *     trigger a "duplicate filename .../partner" sysfs error during
> + *     typec_altmode_create_links(). Use the port-side altmode count for
> + *     SVID X as the authoritative cap and reject any partner altmode that
> + *     would exceed it. This preserves legitimate multi-Mode partner
> + *     altmodes (e.g. vendor SVIDs that the port really does advertise
> + *     twice) while filtering the firmware-generated duplicates that have
> + *     no port counterpart.
> + */
> +static bool ucsi_altmode_is_duplicate(struct ucsi_connector *con, u8 recipient,
> +				      const struct ucsi_altmode *alt_batch, int batch_idx,
> +				      u16 svid, u32 vdo, int offset)
> +{
> +	struct typec_altmode **altmodes;
> +	int port_count, partner_count;
> +	int k;
> +
> +	/* Check for duplicates within the current batch first */
> +	for (k = 0; k < batch_idx; k++) {
> +		if (alt_batch[k].svid == svid && alt_batch[k].mid == vdo) {
> +			ucsi_dump_duplicate_altmode(con, recipient, svid,
> +						    vdo, vdo, offset);
> +			return true;
> +		}
> +	}
> +
> +	switch (recipient) {
> +	case UCSI_RECIPIENT_SOP:
> +		/*
> +		 * Cap partner altmodes per SVID by the port-side count:
> +		 * any further partner altmode for that SVID would alias an
> +		 * already-paired port altmode and break typec sysfs.
> +		 */
> +		port_count = ucsi_altmode_count_svid(con->port_altmode, svid);
> +		partner_count = ucsi_altmode_count_svid(con->partner_altmode,
> +							svid);
> +		if (port_count && partner_count >= port_count) {
> +			ucsi_dump_duplicate_altmode(con, recipient, svid,
> +						    con->partner_altmode[partner_count - 1]->vdo,
> +						    vdo, offset);
> +			return true;
> +		}
> +		return false;
> +	case UCSI_RECIPIENT_CON:
> +		altmodes = con->port_altmode;
> +		break;
> +	case UCSI_RECIPIENT_SOP_P:
> +		altmodes = con->plug_altmode;
> +		break;
> +	default:
> +		return false;
> +	}
> +
> +	/* CON and SOP_P: drop only exact SVID+VDO duplicates. */
> +	for (k = 0; k < UCSI_MAX_ALTMODES; k++) {
> +		if (!altmodes[k])
> +			break;
> +
> +		if (altmodes[k]->svid != svid || altmodes[k]->vdo != vdo)
> +			continue;
> +
> +		ucsi_dump_duplicate_altmode(con, recipient, svid,
> +					    altmodes[k]->vdo, vdo, offset);
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>  static int
>  ucsi_register_altmodes_nvidia(struct ucsi_connector *con, u8 recipient)
>  {
> @@ -674,6 +797,15 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
>  			if (!alt[j].svid)
>  				return 0;
>  
> +			/*
> +			 * Check for duplicates in current batch and already
> +			 * registered altmodes. Skip if duplicate found.
> +			 */
> +			if (ucsi_altmode_is_duplicate(con, recipient, alt, j,
> +						      alt[j].svid, alt[j].mid,
> +						      i - num + j))
> +				continue;
> +
>  			memset(&desc, 0, sizeof(desc));
>  			desc.vdo = alt[j].mid;
>  			desc.svid = alt[j].svid;
> -- 
> 2.53.0
> 

-- 
heikki
