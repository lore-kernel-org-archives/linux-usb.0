Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4117E3F4102;
	Thu, 16 Jul 2026 08:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784191667; cv=none; b=rMSyJlnA21R4XWHCiu3dQzR5cMpx0T1E9A5vCx4QL9FnBqaYlgi5UsG2RqI5XDiTeA+PhSk8vFtmRn53BBEhuQJE8JRGP0g/5MvWNttU8D1gEu3T0b95SeLJW5LkErZFaGFg/sEkrBIe6qoGCt+89Yyzg8Ia/IxoLAfg3X/xpxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784191667; c=relaxed/simple;
	bh=dJ19Vs5X33elAUzaPvg+3KzLayEPIKOhIPUAn4FCpiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=us7AlqYAuwEsD/nPeZPe4slTyObmVK2BJvyL5a2iQViSDDls1RffzJs3xBl1kuoe9/OR2dfMRci16YBFk7+0GzgEwlTV1/vpbzX9uEF1DzDOsaZtq0sI8Kxhb9C9GVnh+5CoPjIt0zlfh8nX7Iltd09mt7IhD6MAyTFX2F7lq+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mMvpN/Za; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mMvpN/Za"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784191663; x=1815727663;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dJ19Vs5X33elAUzaPvg+3KzLayEPIKOhIPUAn4FCpiQ=;
  b=mMvpN/ZafKMVtd5WPJw0INFoP6RsLE8eX5QhmNfWhb+kPH2mku9YZNGG
   Zz0Y91PPMCu2K9rEE46TTY863uN20RFWCZThcTbtv4iLgtNpuotoQMhPn
   hoUAU4gPoR689e5f5NKNAlI34sZ8dtL1IOePaAoZ3GE5PBUynRoS2Nnqq
   +jgGcqrypbWuyKpo2g8mrb0qrWyGzFuXYJ/A3YULp2MHTjW7GQKVUPtKR
   0rYch9VLugRLUkIKqrinkOf4e7vPBI1j36PX48l6lprliuts8BCDTmpIL
   5rElzUA70Kq44P3GmTwOwOfk9iEnzVjbbG0Abh9bi+xWVNWFLZ06XnW5a
   Q==;
X-CSE-ConnectionGUID: mgpyNiAHQm6PqcaMAuyO0Q==
X-CSE-MsgGUID: ZkSw0tGMQ5+/cAzbfG0amg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="102272312"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="102272312"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 01:47:42 -0700
X-CSE-ConnectionGUID: 0eVUMx89S92mfEVsaqI9cQ==
X-CSE-MsgGUID: sBYOhixfQJ2jBnhjdf14rA==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 16 Jul 2026 01:47:40 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 117AA95; Thu, 16 Jul 2026 10:47:39 +0200 (CEST)
Date: Thu, 16 Jul 2026 11:47:37 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: amitsd@google.com
Cc: Badhri Jagan Sridharan <badhri@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kyle Tso <kyletso@google.com>, RD Babiera <rdbabiera@google.com>
Subject: Re: [PATCH] usb: typec: tcpm: Add support for Battery Cap response
 message
Message-ID: <aliaqQzLVVRyBhFO@kuha>
References: <20260714-batt-caps-upstream-v1-1-c86f0a7fbbda@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-batt-caps-upstream-v1-1-c86f0a7fbbda@google.com>

On Tue, Jul 14, 2026 at 11:06:47PM +0000, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
> 
> Add support for responding to Get_Battery_Cap (extended) request with a
> a Battery_Capabilities (extended) msg. The requester will request
> Battery Cap for a specific battery using an index in Get_Battery_Cap. In
> case of failure to identify battery, TCPM shall reply with an
> appropriate message indicating so.
> 
> As the Battery Cap Data Block size is 9 Bytes (lesser than
> MaxExtendedMsgChunkLen of 26B), only a single chunk is required to
> complete the AMS.
> 
> Support for Battery_Capabilities message is required for sinks that
> contain battery as specified in USB PD Rev3.1 v1.8
> ("Applicability of Data Messages" section).
> 
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> This patch depends on the series [1].
> 
> [1] https://lore.kernel.org/all/20260714-batt-status-v5-0-9de4aa900b69@google.com/
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 108 +++++++++++++++++++++++++++++++++++++-----
>  include/linux/usb/pd.h        |  22 +++++++++
>  2 files changed, 117 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index cd33ee131ebd..393266dd55f8 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -234,7 +234,8 @@ enum pd_msg_request {
>  	PD_MSG_DATA_SOURCE_CAP,
>  	PD_MSG_DATA_REV,
>  	PD_MSG_EXT_SINK_CAP_EXT,
> -	PD_MSG_DATA_BATT_STATUS
> +	PD_MSG_DATA_BATT_STATUS,
> +	PD_MSG_EXT_BATT_CAP,
>  };
>  
>  enum adev_actions {
> @@ -1559,6 +1560,14 @@ static int tcpm_pd_send_sink_cap_ext(struct tcpm_port *port)
>  	return tcpm_pd_transmit(port, TCPC_TX_SOP, &msg);
>  }
>  
> +static u16 tcpm_charge_to_energy(int charge, int voltage)
> +{
> +	u64 energy = div_u64((u64)charge * voltage, 1000000);
> +
> +	/* Battery telemetry is reported in increments of 0.1Wh */
> +	return (u16)UW_TO_W(energy * 10);
> +}
> +
>  static int tcpm_pd_send_batt_status(struct tcpm_port *port)
>  {
>  	u16 present_charge = BATTERY_PROPERTY_UNKNOWN;
> @@ -1569,7 +1578,6 @@ static int tcpm_pd_send_batt_status(struct tcpm_port *port)
>  	u8 charging_status = 0;
>  	struct pd_message msg;
>  	int ret, charge_now;
> -	u64 energy_now;
>  	u32 bsdo;
>  
>  	tcpm_get_fixed_batt(port);
> @@ -1595,16 +1603,9 @@ static int tcpm_pd_send_batt_status(struct tcpm_port *port)
>  		ret = power_supply_get_property(batt,
>  						POWER_SUPPLY_PROP_VOLTAGE_AVG,
>  						&val);
> -		if (!ret) {
> -			energy_now = div_u64((u64)charge_now * val.intval,
> -					     1000000);
> -
> -			/*
> -			 * Battery Present Charge is reported in
> -			 * increments of 0.1WH.
> -			 */
> -			present_charge = (u16)UW_TO_W(energy_now * 10);
> -		}
> +		if (!ret)
> +			present_charge = tcpm_charge_to_energy(charge_now,
> +							       val.intval);
>  	}
>  
>  	ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_STATUS, &val);
> @@ -1640,6 +1641,71 @@ static int tcpm_pd_send_batt_status(struct tcpm_port *port)
>  	return tcpm_pd_transmit(port, TCPC_TX_SOP, &msg);
>  }
>  
> +static int tcpm_pd_send_batt_cap(struct tcpm_port *port)
> +{
> +	u16 design_cap = BATTERY_PROPERTY_UNKNOWN;
> +	u16 charge_cap = BATTERY_PROPERTY_UNKNOWN;
> +	u32 batt_id = port->batt_request_id;
> +	union power_supply_propval val;
> +	struct batt_cap_ext_msg bcdb;
> +	struct power_supply *batt;
> +	bool invalid_ref = true;
> +	struct pd_message msg;
> +	u8 data_obj_cnt;
> +	int ret, vol;
> +
> +	tcpm_get_fixed_batt(port);
> +	memset(&msg, 0, sizeof(msg));
> +
> +	if (batt_id >= port->fixed_batt_cnt || batt_id >= MAX_NUM_FIXED_BATT)
> +		goto send_cap;
> +
> +	invalid_ref = false;
> +	batt = port->fixed_batt[batt_id];
> +	ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_VOLTAGE_AVG,
> +					&val);
> +	if (!ret) {
> +		vol = val.intval;
> +		ret = power_supply_get_property(batt,
> +						POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN,
> +						&val);
> +		if (!ret)
> +			design_cap = tcpm_charge_to_energy(val.intval, vol);
> +
> +		ret = power_supply_get_property(batt,
> +						POWER_SUPPLY_PROP_CHARGE_FULL,
> +						&val);
> +		if (!ret)
> +			charge_cap = tcpm_charge_to_energy(val.intval, vol);
> +	}
> +
> +send_cap:
> +
> +	/*
> +	 * As per the USB PD Rev3.1 v1.8 spec, if a battery VID (assigned by the
> +	 * USB-IF) does not exist or an invalid battery reference is made by the
> +	 * requestor, then set the VID field to 0xffff. If the VID field is
> +	 * 0xffff, set the PID field to 0.
> +	 */
> +	bcdb.vid = BATTERY_PROPERTY_UNKNOWN;
> +	bcdb.pid = 0;
> +	bcdb.batt_design_cap = cpu_to_le16(design_cap);
> +	bcdb.batt_last_chg_cap = cpu_to_le16(charge_cap);
> +	bcdb.batt_type = invalid_ref ? BATT_CAP_BATT_TYPE_INVALID_REF : 0;
> +	memcpy(msg.ext_msg.data, &bcdb, sizeof(bcdb));
> +	msg.ext_msg.header = PD_EXT_HDR_LE(sizeof(bcdb),
> +					   0, /* Denotes if request chunk */
> +					   0, /* Chunk number */
> +					   1  /* Chunked */);
> +
> +	data_obj_cnt = count_chunked_data_objs(sizeof(bcdb));
> +	msg.header = PD_HEADER_EXT_LE(PD_EXT_BATT_CAP, port->pwr_role,
> +				      port->data_role, port->negotiated_rev,
> +				      port->message_id, data_obj_cnt);
> +
> +	return tcpm_pd_transmit(port, TCPC_TX_SOP, &msg);
> +}
> +
>  static void mod_tcpm_delayed_work(struct tcpm_port *port, unsigned int delay_ms)
>  {
>  	if (delay_ms) {
> @@ -4041,8 +4107,16 @@ static void tcpm_pd_ext_msg_request(struct tcpm_port *port,
>  			tcpm_set_state(port, SOFT_RESET_SEND, 0);
>  		}
>  		break;
> -	case PD_EXT_SOURCE_CAP_EXT:
>  	case PD_EXT_GET_BATT_CAP:
> +		if (data_size >= 1) {
> +			port->batt_request_id = ext_msg->data[0];
> +			tcpm_pd_handle_msg(port, PD_MSG_EXT_BATT_CAP,
> +					   GETTING_BATTERY_CAPABILITIES);
> +		} else {
> +			tcpm_set_state(port, SOFT_RESET_SEND, 0);
> +		}
> +		break;
> +	case PD_EXT_SOURCE_CAP_EXT:
>  	case PD_EXT_BATT_CAP:
>  	case PD_EXT_GET_MANUFACTURER_INFO:
>  	case PD_EXT_MANUFACTURER_INFO:
> @@ -4261,6 +4335,14 @@ static bool tcpm_send_queued_message(struct tcpm_port *port)
>  					 ret);
>  			tcpm_ams_finish(port);
>  			break;
> +		case PD_MSG_EXT_BATT_CAP:
> +			ret = tcpm_pd_send_batt_cap(port);
> +			if (ret)
> +				tcpm_log(port,
> +					 "Failed to send battery cap ret=%d",
> +					 ret);
> +			tcpm_ams_finish(port);
> +			break;
>  		default:
>  			break;
>  		}
> diff --git a/include/linux/usb/pd.h b/include/linux/usb/pd.h
> index afb9c2c65588..10ff4af7dedc 100644
> --- a/include/linux/usb/pd.h
> +++ b/include/linux/usb/pd.h
> @@ -106,6 +106,9 @@ enum pd_ext_msg_type {
>  #define PD_HEADER_LE(type, pwr, data, rev, id, cnt) \
>  	cpu_to_le16(PD_HEADER((type), (pwr), (data), (rev), (id), (cnt), (0)))
>  
> +#define PD_HEADER_EXT_LE(type, pwr, data, rev, id, cnt) \
> +	cpu_to_le16(PD_HEADER((type), (pwr), (data), (rev), (id), (cnt), (1)))
> +
>  static inline unsigned int pd_header_cnt(u16 header)
>  {
>  	return (header >> PD_HEADER_CNT_SHIFT) & PD_HEADER_CNT_MASK;
> @@ -219,6 +222,25 @@ static inline u8 count_chunked_data_objs(u32 size)
>  	return ((size / 4) + (size % 4 ? 1 : 0));
>  }
>  
> +/**
> + * batt_cap_ext_msg - Battery capability extended PD message
> + * @vid: Battery Vendor ID (assigned by USB-IF)
> + * @pid: Battery Product ID (assigned by battery or device vendor)
> + * @batt_design_cap: Battery design capacity in 0.1Wh
> + * @batt_last_chg_cap: Battery last full charge capacity in 0.1Wh
> + * @batt_type: Battery Type. bit0 when set indicates invalid battery reference.
> + *             Rest of the bits are reserved.
> + */
> +struct batt_cap_ext_msg {
> +	__le16 vid;
> +	__le16 pid;
> +	__le16 batt_design_cap;
> +	__le16 batt_last_chg_cap;
> +	u8 batt_type;
> +} __packed;
> +
> +#define BATT_CAP_BATT_TYPE_INVALID_REF BIT(0)
> +
>  /* Sink Caps Extended Data Block Version */
>  #define SKEDB_VER_1_0				1
>  
> 
> ---
> base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
> change-id: 20260714-batt-caps-upstream-57f2cbe8eed3
> prerequisite-change-id: 20260501-batt-status-16b6761c0bb1:v5
> prerequisite-patch-id: 39dd78a0bb18e681fcd8efb01b6879dbeb881a3a
> prerequisite-patch-id: 621fa71ad856f4b3246ec480ab17f8089b082932
> 
> Best regards,
> -- 
> Amit Sunil Dhamne <amitsd@google.com>
> 

-- 
heikki
